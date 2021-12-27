#' ---
#' título: 'Análisis exploratorio de datos. Riqueza y abundancia'
#' autor: "JR"
#'fecha: "13 de octubre, 2020"
#' salida: github_document
#' ---

#' ### Área de cargar paquetes
library(vegan)
library(tidyverse)
library(sf)
source('biodata/funciones.R' )

#' ### Área de cargar datos
#' Censo (el objeto se carga con prefijo "censo") y matriz de comunidad (prefijo "mc")
load("~/unidad-0-asignacion-99-mi-manuscrito-GeografosigloXXV/biodata/Moraceae.Rdata")
load('biodata/matriz_ambiental.Rdata') #Matriz ambiental, se carga como "bci_env_grid"

#'### Imprimir datos en pantalla (impresiones parciales con head)
head(censo_morac)
head(mc_morac)
bci_env_grid # No necesita imprimirse parcialment

#' ### También podemos usar
#' Requiere que se haya cargado ya la colección tidyverse
censo_morac %>% tibble
mc_morac %>% tibble

#' ### Lista de especies
sort(colnames(mc_morac))

#' ### Número de sitios, tanto en matriz de comunidad como en ambiental
#' Verifica que coinciden
nrow(mc_morac) #En la matriz de comunidad
nrow(bci_env_grid) #En la matriz ambiental

#' ### Riqueza numérica de especies (usando matriz de comunidad) por quadrat
#'Nota: cargar paquete vegan arriba, en el área de paquetes
specnumber(mc_morac)
sort(specnumber(mc_apcyn_melic_saptc))  # Ordenados ascendentemente
summary(specnumber(mc_morac))  # Resumen estadístico

#' ### Abundancia de especies por quadrat
sort(rowSums(mc_morac))
summary(rowSums(mc_morac))# Resumen estadístico

#' ### Abundancia por especie
sort(colSums(mc_morac))
summary(colSums(mc_morac))# Resumen estadístico

#' ### Riqueza numérica de toda la "comunidad"
specnumber(colSums(mc_morac))

#' ### Abundancia de toda la comunidad
sum(colSums(mc_morac)

#' ### Una tabla para el manuscrito, es necesario asignarle nombre
#' Para esto, usaré la colección "tidyverse"
abun_sp <- (censo_morac) %>%
  group_by(Latin) %>% 
  count() %>% 
  arrange(desc(n))
 abun_sp

#' ### Un gráfico para el manuscrito
#' Gráfico de mosaicos de la abundancia por especie por cuadros
abun_sp_q <- crear_grafico_mosaico_de_mc(mc_apcyn_melic_saptc, tam_rotulo = 6)
abun_sp_q
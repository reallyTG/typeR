## ----setup, include = FALSE----------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----message=FALSE, warning=FALSE----------------------------------------
library(nhdR)
library(dplyr)
library(ggplot2)
library(sf)

## ------------------------------------------------------------------------
ggplot() + 
  geom_sf(data = gull$sp$NHDWaterbody) + 
  geom_sf(data = gull$sp$NHDFlowLine)

gull_sf <- gull$sp$NHDFlowLine

## ----eval=FALSE----------------------------------------------------------
#  eromflow  <- nhd_plus_load(4, "EROMExtension", "EROM_MA0001") %>%
#    filter(ComID %in% gull$sp$NHDFlowLine$COMID) %>%
#    select(ComID, Q0001F)
#  
#  gull_sf <- left_join(gull_sf, eromflow, by = c("COMID" = "ComID"))

## ----eval=FALSE----------------------------------------------------------
#  vogelflow  <- nhd_plus_load(4, "VogelExtension", "vogelflow") %>%
#    filter(COMID %in% gull$sp$NHDFlowLine$COMID,
#           MAFLOWV != -9999.00000)
#  
#  gull_sf <- left_join(gull_sf, vogelflow, by = "COMID")

## ----echo=FALSE----------------------------------------------------------
# gull_sf <- dplyr::select(gull_sf, -Q0001F:-MAVELV)
gull_sf <- gull_flow

## ------------------------------------------------------------------------
gull_sf <- dplyr::filter(gull_sf, !is.na(Q0001F)) 
gull_sf %>%  
  ggplot() + 
  geom_sf(data = gull$sp$NHDWaterbody) + 
  geom_sf(aes(color = gull_sf$Q0001F), size = gull_sf$Q0001F / 20) +
  labs(color = "EROM Flow (cms)")

gull_sf <- filter(gull_sf, !is.na(MAFLOWV))
gull_sf %>% 
  ggplot() + 
  geom_sf(data = gull$sp$NHDWaterbody) + 
  geom_sf(aes(color = gull_sf$MAFLOWV), size = gull_sf$MAFLOWV / 20) +
  labs(color = "Vogel Flow (cms)")


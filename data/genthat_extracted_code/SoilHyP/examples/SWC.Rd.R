library(SoilHyP)


### Name: SWC
### Title: Soil water content
### Aliases: SWC

### ** Examples

# --------------------------------------------
#  Unimodal van Genuchten
# --------------------------------------------
SWC(suc = seq(1, 1000, by = 1), par.shp = c(ths = 0.4, thr = 0, alfa = 0.02, n = 1.5),
FUN.shp = c('vG'), modality = 'uni', suc.negativ = FALSE)
# --------------------------------------------
#  Bimodal van Genuchten
# --------------------------------------------
SWC(suc = seq(1, 1000, by = 1),
par.shp = c(ths = 0.4, thr = 0, alfa = 0.02, n = 2, w2 = 0.2, alfa2 = 1, n2 = 10),
FUN.shp  = c('vG'), modality = c('bi'), suc.negativ = FALSE)
# --------------------------------------------
#  Unimodal PDI
# --------------------------------------------
SWC(suc = seq(1, 1000, by = 1), par.shp = list(ths = 0.4, thr = 0, n = 1.6, alfa = 0.02),
  FUN.shp = c('pdi'), modality = c('uni'), suc.negativ = FALSE)
# --------------------------------------------




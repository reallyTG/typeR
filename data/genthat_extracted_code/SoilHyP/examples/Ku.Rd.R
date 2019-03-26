library(SoilHyP)


### Name: Ku
### Title: Unsaturated hydraulic conductivity
### Aliases: Ku

### ** Examples

# --------------------------------------------
#  Unimodal van Genuchten
# --------------------------------------------
Ku(suc = seq(1, 1000, by = 1), FUN.shp = 'vGM',
  par.shp = list(Ks = 10, ths = 0.5, thr = 0, alfa = 0.02, n = 1.5, tau = 0.5),
  modality = 'uni', suc.negativ = FALSE)
# --------------------------------------------
#  Bimodal van Genuchten
# --------------------------------------------
Ku(suc = seq(1, 1000, by = 1), FUN.shp = 'vGM',
  par.shp = list(Ks = 10, ths = 0.5, thr = 0, alfa = 0.02,
  n = 1.5, tau = 0.5, w2 = 0.1, alfa2 = 0.1, n2 = 3),
  modality = 'bi', suc.negativ = FALSE)
# --------------------------------------------
#  Unimodal Peters-Durner-Iden (PDI)
# --------------------------------------------
Ku(suc = seq(1, 1000, by = 1), FUN.shp = 'PDI', modality = 'uni',
  par.shp = list(Ks = 10, ths = 0.5, thr = 0, alfa = 0.02, n = 1.5, tau = 0.5, omega = 0.001),
  suc.negativ = FALSE)




## ----global_options, include=FALSE---------------------------------------
library(raster)
library(NLMR)

## ---- fig.height=7, fig.width=7, fig.align='center'----------------------
x <- NLMR::nlm_random(20,20)
plot(x)

## ---- fig.height=7, fig.width=7, fig.align='center'----------------------
  #Create primary landscape raster
  pL <- NLMR::nlm_edgegradient(ncol = 100,
                               nrow = 100)

  plot(pL)

  #Create secondary landscape rasters
  sL1 <- NLMR::nlm_distancegradient(ncol = 100,
                                    nrow = 100,
                                    origin = c(10, 10, 10, 10))
  sL2 <- NLMR::nlm_random(ncol = 100,
                          nrow = 100)

  mL1 <- pL + (sL1 + sL2)
  
  plot(mL1)

## ----fig.height=7, fig.width=7, fig.align='center'-----------------------
nr <- NLMR::nlm_fbm(50, 100, fract_dim = 1.2)
                              
nr_classified <- landscapetools::util_classify(nr, weighting = c(0.3, 0.3, 0.3))

plot(nr_classified)


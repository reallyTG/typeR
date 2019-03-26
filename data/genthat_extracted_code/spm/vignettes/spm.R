## ---- include=TRUE, eval=FALSE-------------------------------------------
#  install.packages("spm", dependencies = c("Imports", "Suggests"))

## ---- include=TRUE, eval=FALSE-------------------------------------------
#  library(spm)
#  data(petrel)
#  set.seed(1234)
#  idwcv1 <- idwcv(petrel[, c(1,2)], petrel[, 5], nmax = 12, idp = 2, predacc = "VEcv")
#  idwcv1
#  [1] 23.11333

## ---- include=TRUE, eval=FALSE-------------------------------------------
#  library(spm)
#  data(petrel)
#  set.seed(1234)
#  rfokcv1 <- rfokcv(petrel[, c(1,2)], petrel[, c(1,2, 6:9)], petrel[, 5], predacc = "VEcv")
#  rfokcv1
#  [1] 39.88995

## ---- include=TRUE, eval=FALSE-------------------------------------------
#  data(petrel)
#  idp <- c((1:10)*0.2)
#  nmax <- c(10:20)
#  idwopt <- array(0,dim=c(length(idp),length(nmax)))
#  for (i in 1:length(idp)) {
#  for (j in 1:length(nmax))  {
#  set.seed(1234)
#  idwcv2.3 <- idwcv(petrel[, c(1,2)], petrel[, 5], nmax = nmax[j], idp = idp[i], predacc = "VEcv" )
#  idwopt[i, j] <- idwcv2.3
#    }
#  }
#  which (idwopt == max(idwopt), arr.ind = T )
#  >      row col
#  [1,]   3   3
#  idp[3]
#  > [1] 0.6
#  nmax[3]
#  > [1] 12

## ---- include=TRUE, eval=FALSE-------------------------------------------
#  library(spm)
#  data(petrel)
#  set.seed(1234)
#  idwcv1 <- idwcv(petrel[, c(1,2)], petrel[, 5], nmax = 12, idp = 0.6, predacc = "VEcv")
#  idwcv1
#  [1] 35.93557

## ---- include=TRUE, eval=FALSE-------------------------------------------
#  n <- 100 # number of iterations, 60 to 100 is recommended.
#  measures <- NULL
#  for (i in 1:n) {
#   idwcv1 <- idwcv(petrel [, c(1,2)], petrel [, 5], nmax = 12, idp = 0.6, predacc = "ALL")
#   measures <- rbind(measures, idwcv1$vecv)
#   }
#  mean(measures)
#  [1] 33.69691

## ---- include=TRUE, eval=FALSE-------------------------------------------
#  library(spm)
#  data(petrel)
#  data(petrel.grid)
#  idwpred1 <- idwpred(petrel[, c(1,2)], petrel[, 5], petrel.grid, nmax = 12, idp = 0.6)
#  names(idwpred1)
#  [1] "LON"       "LAT"       "var1.pred" "var1.var"
#  idwpred1 <- (idwpred1)[, -4] # remove the 4th column as it contains no information.
#  class(idwpred1)
#  [1] "data.frame"
#  names(idwpred1) <- c("longitude", "latitude", "gravel")
#  head(idwpred1)
#          longitude latitude  gravel
#  470277  128.8022  -10.60239 22.00789
#  470278  128.8047  -10.60239 22.00805
#  470279  128.8072  -10.60239 22.00822
#  470280  128.8097  -10.60239 22.00838
#  470281  128.8122  -10.60239 22.00855
#  470282  128.8147  -10.60239 22.00873

## ---- include=TRUE, eval=FALSE-------------------------------------------
#  set.seed(1234)
#  library(spm)
#  data(petrel)
#  data(petrel.grid)
#  data(petrel)
#  data(petrel.grid)
#  rfokpred1 <- rfokpred(petrel[, c(1,2)], petrel[, c(1,2, 6:9)], petrel[, 5],
#   petrel.grid[, c(1,2)], petrel.grid, ntree = 500, nmax = 11, vgm.args = ("Log"))
#  class(rfokpred1)
#  [1] "data.frame"
#  names(rfokpred1)
#  
#  [1] "LON"         "LAT"         "Predictions" "Variances"


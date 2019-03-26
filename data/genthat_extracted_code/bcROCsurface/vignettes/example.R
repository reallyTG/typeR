## ---- eval=FALSE, install_cran-------------------------------------------
#  install.packages("bcROCsurface")

## ---- eval=TRUE, loadlib-------------------------------------------------
library(bcROCsurface)

## ---- eval=FALSE, loaddat------------------------------------------------
#  data(EOC)

## ---- eval=FALSE, loaddat2-----------------------------------------------
#  head(EOC)

## ----preDiseaseFULL, eval=TRUE-------------------------------------------
Dfull <- preDATA(EOC$D.full, EOC$CA125)

## ---- eval=FALSE---------------------------------------------------------
#  head(Dfull$D)

## ---- eval=FALSE---------------------------------------------------------
#  head(Dfull$Dvec)

## ----setup, echo=FALSE---------------------------------------------------
library(knitr)
library(rgl)
knit_hooks$set(webgl = hook_webgl)

## ----ROCsFULL, webGL = TRUE----------------------------------------------
Dvec.full <- Dfull$Dvec
ROCs(method = "full", T = EOC$CA125, Dvec = Dvec.full, ncp = 30, ellipsoid = TRUE,
     cpst = c(-0.56, 2.31))

## ----vusfull, eval = FALSE-----------------------------------------------
#  vus("full", T = EOC$CA125, Dvec = Dvec.full, ci = TRUE)

## ----disease, eval = TRUE------------------------------------------------
Dna <- preDATA(EOC$D, EOC$CA125)
Dvec.na <- Dna$Dvec
D.na <- Dna$D
rho.out <- rhoMLogit(D.na ~ CA125 + CA153 + Age, data = EOC, test = TRUE, trace = TRUE)

## ----ROCsFI, webgl = TRUE------------------------------------------------
ROCs(method = "fi", T = EOC$CA125, Dvec = Dvec.na, V = EOC$V, rhoEst = rho.out, ncp = 30,
     ellipsoid = TRUE, cpst = c(-0.56, 2.31))

## ----vusfi,  eval=FALSE--------------------------------------------------
#  vus(method = "fi", T = EOC$CA125, Dvec = Dvec.na, V = EOC$V, rhoEst = rho.out, ci = TRUE)

## ----ROCsMSI, webgl = TRUE-----------------------------------------------
ROCs(method = "msi", T = EOC$CA125, Dvec = Dvec.na, V = EOC$V, rhoEst = rho.out, ncp = 30,
     ellipsoid = TRUE, cpst = c(-0.56, 2.31))

## ----vusmsi,  eval=FALSE-------------------------------------------------
#  vus(method = "msi", T = EOC$CA125, Dvec = Dvec.na, V = EOC$V, rhoEst = rho.out, ci = TRUE)

## ----verification, eval = TRUE-------------------------------------------
pi.out <- psglm(V ~ CA125 + CA153 + Age, data = EOC, model = "logit", test = TRUE, trace = TRUE)

## ----ROCsIPW, webgl = TRUE-----------------------------------------------
ROCs(method = "ipw", T = EOC$CA125, Dvec = Dvec.na, V = EOC$V, piEst = pi.out, ncp = 30,
     ellipsoid = TRUE, cpst = c(-0.56, 2.31))

## ----vusipw, eval=FALSE--------------------------------------------------
#  vus(method = "ipw", T = EOC$CA125, Dvec = Dvec.na, V = EOC$V, piEst = pi.out, ci = TRUE)

## ----ROCsSPE, webgl = TRUE-----------------------------------------------
ROCs(method = "spe", T = EOC$CA125, Dvec = Dvec.na, V = EOC$V, rhoEst = rho.out,
     piEst = pi.out, ncp = 30, ellipsoid = TRUE, cpst = c(-0.56, 2.31))

## ----vusspe, eval=FALSE--------------------------------------------------
#  vus(method = "spe", T = EOC$CA125, Dvec = Dvec.na, V = EOC$V, rhoEst = rho.out,
#      piEst = pi.out, ci = TRUE)

## ----1nn, eval = TRUE----------------------------------------------------
XX <- cbind(EOC$CA125, EOC$CA153, EOC$Age)
rho.1nn <- rhoKNN(XX, Dvec = Dvec.na, V = EOC$V, K = 1, type = "mahala")

## ----ROCs1NN, webgl = TRUE-----------------------------------------------
ROCs("knn", T = EOC$CA125, Dvec.na, V = EOC$V, rhoEst = rho.1nn, ncp = 30, ellipsoid = TRUE,
     cpst = c(-0.56, 2.31))

## ----vus1nn, eval = FALSE------------------------------------------------
#  vus(method = "knn", T = EOC$CA125, Dvec = Dvec.na, V = EOC$V, rhoEst = rho.1nn, ci = TRUE,
#      parallel = TRUE)

## ----cvKnn, eval = TRUE--------------------------------------------------
CVknn(XX, Dvec.na, EOC$V, type = "mahala", plot = TRUE)


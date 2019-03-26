## ----setup, echo=FALSE---------------------------------------------------
knitr::opts_chunk$set(collapse = TRUE, comment = "#>")

## ----Figure1, echo=FALSE, out.width = "75%", fig.pos = 'h',fig.cap="\\label{Fig1} Main functionatities of spsur package"----
knitr::include_graphics('Figure1_JSS2.png')

## ----install-------------------------------------------------------------
# install.packages("spsur")

## ----cargadatos----------------------------------------------------------
library(spsur)
data("spc", package = "spsur")

## ----spcformula----------------------------------------------------------
spcformula <- WAGE83 | WAGE81 ~ UN83 + NMR83 + SMSA | UN80 + NMR80 + SMSA

## ----NCOVRformula--------------------------------------------------------
data(NCOVR, package = "spsur")
NCOVRformula <- HR80 | DV80 | FP79 ~ PS80 + UE80 | PS80 + UE80 + SOUTH | PS80

## ----LMspc---------------------------------------------------------------
LMs.spc <- lmtestspsur(Form = spcformula, data = spc, W = Wspc)

## ---- echo=FALSE---------------------------------------------------------
rm(LMs.spc)

## ----LMNCOVR-------------------------------------------------------------
LMs.NCOVR <- lmtestspsur(Form = NCOVRformula, data = NCOVR, W = W)

## ----echo=FALSE----------------------------------------------------------
rm(LMs.NCOVR)

## ------------------------------------------------------------------------
Y <- as.matrix(c(NCOVR$HR80,NCOVR$DV80,NCOVR$FP79))
Intercep <- matrix(1,ncol = 1,nrow = 3085)
X1 <- cbind(Intercep,NCOVR$PS80,NCOVR$UE80)
X2 <- cbind(Intercep,NCOVR$PS80,NCOVR$UE80,NCOVR$SOUTH)
X3 <- cbind(Intercep,NCOVR$PS80)
X <- as.matrix(Matrix::bdiag(X1,X2,X3))

## ----echo=FALSE----------------------------------------------------------
rm(X1,X2,X3)

## ----LMNCOVR2, results="hide"--------------------------------------------
LMs.NCOVR.matrix <- lmtestspsur(Y = Y, X = X, G = 3, Tm = 1, N = 3085, W = W)

## ----echo=FALSE----------------------------------------------------------
rm(LMs.NCOVR.matrix) 

## ----spcsurslm-----------------------------------------------------------
spcsur.slm <- spsurml(Form = spcformula, data = spc, type = 'slm', W = Wspc)

## ------------------------------------------------------------------------
summary(spcsur.slm)

## ----todos, eval = FALSE-------------------------------------------------
#  spcSUR.sim <- spsurml(Form = spcformula, data = spc, type = 'sim', W = Wspc)
#  spcSUR.slx <- spsurml(Form = spcformula, data = spc, type = 'slx', W = Wspc)
#  spcSUR.sem <- spsurml(Form = spcformula, data = spc, type = 'sem', W = Wspc)
#  spcSUR.sarar <- spsurml(Form = spcformula, data = spc, type = 'sarar', W = Wspc)
#  spcSUR.sdm <- spsurml(Form = spcformula, data = spc, type = 'sdm', W = Wspc)
#  spcSUR.sdem <- spsurml(Form = spcformula, data = spc, type = 'sdem', W = Wspc)

## ---- eval = FALSE-------------------------------------------------------
#  mlcontrol <- list(tol = 0.1, maxit = 20, trace = FALSE)
#  NCOVRSUR.slm <- spsurml(Form = NCOVRformula, data = NCOVR,
#                        type = 'slm', W = W, control = mlcontrol, cov = FALSE)

## ---- eval = FALSE, echo=FALSE-------------------------------------------
#  rm(NCOVRSUR.slm,mlcontrol)

## ---- eval = FALSE-------------------------------------------------------
#  mlcontrol <- list(tol = 0.1, maxit = 20, trace = FALSE)
#  NCOVRSUR.slm.matrix <- spsurml(Y = Y, X = X, G = 3, Tm = 1, N = 3085,
#                               W = W, type = 'slm', control = mlcontrol,
#                               cov = FALSE)

## ---- eval = FALSE, echo=FALSE-------------------------------------------
#  rm(NCOVRSUR.slm.matrix,mlcontrol,X,Y)

## ----slm3sls-------------------------------------------------------------
NCOVRSUR.slm.3sls <-spsur3sls(Form = NCOVRformula, data = NCOVR, type = "slm", W = W)
summary(NCOVRSUR.slm.3sls)

## ---- echo = FALSE-------------------------------------------------------
rm(NCOVRSUR.slm.3sls)

## ----ex_spsurtime--------------------------------------------------------
data(NCOVR,package="spsur")
N <- nrow(NCOVR)
Tm <- 4
index_time <- rep(1:Tm, each = N)
index_indiv <- rep(1:N, Tm)
pHR <- c(NCOVR$HR60, NCOVR$HR70, NCOVR$HR80, NCOVR$HR90)
pPS <- c(NCOVR$PS60, NCOVR$PS70, NCOVR$PS80, NCOVR$PS90)
pUE <- c(NCOVR$UE60, NCOVR$UE70, NCOVR$UE80, NCOVR$UE90)
pNCOVR <- data.frame(indiv = index_indiv, time = index_time,
                      HR = pHR, PS = pPS, UE = pUE)
rm(NCOVR,pHR,pPS,pUE,index_time,index_indiv)
form_pHR <- HR ~ PS + UE
pHR_slm <- spsurtime(Form = form_pHR, data = pNCOVR, W = W,
                     time = pNCOVR$time, type = "slm", method = "3sls")
summary(pHR_slm)

## ----echo=FALSE----------------------------------------------------------
rm(pHR_slm,pNCOVR)

## ----LRtest, eval = FALSE------------------------------------------------
#  ## Not included the results of execution in vignette to save time.
#  LRtests <- lrtestspsur(Form = spcformula, data = spc, W = Wspc)

## ---- echo=FALSE, eval = FALSE-------------------------------------------
#  rm(LRtests)

## ----waldbeta2-----------------------------------------------------------
R1 <- matrix(c(1,0,0,0,-1,0,0,0), nrow = 1)
b1 <- matrix(0, ncol = 1)
Wald_beta <- wald_betas(results = spcsur.slm, R = R1, b = b1)

## ---- echo=FALSE---------------------------------------------------------
rm(Wald_beta)

## ----estrest, eval = FALSE-----------------------------------------------
#  ## Not included the results of execution in vignette to save time.
#  R1 <- matrix(c(1,0,0,0,-1,0,0,0),nrow=1)
#  b1 <- matrix(0, ncol = 1)
#  spcSUR.slm.restricted <- spsurml(Form = spcformula, data = spc,
#                 type = "slm", W = Wspc, R = R1, b = b1, control=list(tol=0.01,maxit=200,trace=FALSE))

## ---- eval = FALSE-------------------------------------------------------
#  summary(spcSUR.slm.restricted)

## ----walddeltas, eval = FALSE--------------------------------------------
#  ## Not included the results of execution in vignette to save time.
#  R2 <- matrix(c(1,-1), nrow = 1)
#  b2 <- matrix(0, ncol = 1)
#  Wald_lambda <- wald_deltas(results=spcSUR.slm.restricted, R = R2, b = b2)

## ---- echo = FALSE, eval = FALSE-----------------------------------------
#  rm(spcSUR.slm.restricted, Wald_lambda)

## ----LR_betas, eval = FALSE----------------------------------------------
#  ## Not included the results of execution in vignette to save time.
#  R1 <- matrix(c(1,0,0,0,-1,0,0,0), nrow = 1)
#  b1 <- matrix(0, ncol = 1)
#  LR_SMSA <- lr_betas_spsur(Form = spcformula, data = spc, W = Wspc,
#                             type = "slm", R = R1, b = b1, trace = FALSE,
#                             printmodels = FALSE)

## ---- echo=FALSE, eval = FALSE-------------------------------------------
#  rm(LR_SMSA)

## ----impacts.slm, eval = FALSE-------------------------------------------
#  ## Not included the results of execution in vignette to save time.
#  spcsur.slm.impacts <- impacts(spcsur.slm)

## ---- echo = FALSE, eval = FALSE-----------------------------------------
#  rm(spcsur.slm.impacts)

## ----example_general, eval = FALSE---------------------------------------
#  data(NCOVR,package="spsur")
#  N <- nrow(NCOVR)
#  Tm <- 4
#  index_time <- rep(1:Tm, each = N)
#  index_indiv <- rep(1:N, Tm)
#  pHR <- c(NCOVR$HR60, NCOVR$HR70, NCOVR$HR80, NCOVR$HR90)
#  pPS <- c(NCOVR$PS60, NCOVR$PS70, NCOVR$PS80, NCOVR$PS90)
#  pUE <- c(NCOVR$UE60, NCOVR$UE70, NCOVR$UE80, NCOVR$UE90)
#  pDV <- c(NCOVR $DV60, NCOVR$DV70, NCOVR$DV80, NCOVR$DV90)
#  pFP <- c(NCOVR$FP59, NCOVR$FP70, NCOVR$FP80, NCOVR$FP90)
#  pSOUTH <- rep(NCOVR$SOUTH, Tm)
#  pNCOVR <- data.frame(indiv = index_indiv, time = index_time,
#                        HR = pHR, PS = pPS, UE = pUE, DV = pDV,
#                        FP = pFP, SOUTH = pSOUTH)
#  rm(NCOVR,pHR,pPS,pUE,pDV,pFP,pSOUTH,index_time,index_indiv)
#  pform <- HR | DV | FP ~ PS + UE | PS + UE + SOUTH | PS

## ---- eval = FALSE-------------------------------------------------------
#  ## Not included the results of execution in vignette to save time.
#   psur_slm <- spsurml(Form = pform, data = pNCOVR, W = W,
#                       type = "slm", cov = FALSE,
#                    control = list(tol = 0.1, maxit = 200, trace = FALSE))
#  psur_slm$deltas; psur_slm$betas; psur_slm$Sigma_corr

## ---- echo=FALSE, eval = FALSE-------------------------------------------
#  rm(pNCOVR,psur_slm, eval = FALSE)

## ----dgpsur, results='hide', eval = FALSE--------------------------------
#  Tm <- 2; G <- 3; N <- 500
#  Sigma <- matrix(0.3, ncol = G, nrow = G)
#  diag(Sigma) <- 1
#  Betas <- c(1,2,3,1,-1,0.5,1,-0.5,2)
#  Thetas <- c(1,-1,0.5,-0.5,1,0)
#  lambda <- 0.5
#  co <- cbind(runif(N,0,1),runif(N,0,1))
#  W <- spdep::nb2mat(spdep::knn2nb(spdep::knearneigh(co, k = 5,longlat = FALSE)))
#  DGP <- dgp_spsur(Sigma = Sigma, Betas = Betas, Thetas = Thetas,
#                   lambda = lambda, Tm = Tm, G = G, N = N, p = 3, W = W)

## ---- eval = FALSE-------------------------------------------------------
#  ## Not included the results of execution in vignette to save time.
#  sdm_sim <- spsurml(Y = DGP$Y, X = DGP$X, type = "sdm", G = G,
#                     Tm = Tm, N = N, p = 3, W = W,
#                     control = list(tol = 0.01, maxit = 200,
#                                    trace = FALSE))
#  summary(sdm_sim)

## ---- echo = FALSE, eval = FALSE-----------------------------------------
#  rm(sdm_sim,DGP)


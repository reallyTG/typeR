library(spsur)


### Name: spsurml
### Title: Maximum likelihood estimation of spatial SUR model.
### Aliases: spsurml

### ** Examples


#################################################
######## CROSS SECTION DATA (G>1; Tm=1) ########
#################################################

#### Example 1: Spatial Phillips-Curve. Anselin (1988, p. 203)
## It usually requires 2-3 minutes maximum...
rm(list = ls()) # Clean memory
data(spc)
Tformula <- WAGE83 | WAGE81 ~ UN83 + NMR83 + SMSA | UN80 + NMR80 + SMSA
spcsur.sim <-spsurml(Form = Tformula, data = spc, type = "sim", W = Wspc)
summary(spcsur.sim)

## A SUR-SLX model
spcsur.slx <-spsurml(Form = Tformula, data = spc, type = "slx", W = Wspc)
summary(spcsur.slx)
## No test: 
## A SUR-SLM model
spcsur.slm <-spsurml(Form = Tformula, data = spc, type = "slm", W = Wspc)
summary(spcsur.slm)
rm(spcsur.slm) # remove

## A SUR-SEM model
spcsur.sem <-spsurml(Form = Tformula, data = spc, type = "sem", W = Wspc)
summary(spcsur.sem)
rm(spcsur.sem) # remove

## A SUR-SDM model
spcsur.sdm <-spsurml(Form = Tformula, data = spc, type = "sdm", W = Wspc)
summary(spcsur.sdm)
rm(spcsur.sdm) # remove

## A SUR-SDEM model
spcsur.sdem <-spsurml(Form = Tformula, data = spc, type = "sdem", W = Wspc)
summary(spcsur.sdem)
rm(spcsur.sdem) # remove

## A SUR-SARAR model
spcsur.sarar <-spsurml(Form = Tformula, data = spc, type = "sarar", W = Wspc)
summary(spcsur.sarar)
rm(spcsur.sarar) # remove
## End(No test)

#################################################
########  G=1; Tm>1         ########
#################################################

#### Example 2: Homicides + Socio-Economics (1960-90)
# Homicides and selected socio-economic characteristics for continental
# U.S. counties.
# Data for four decennial census years: 1960, 1970, 1980 and 1990.
# \url{https://geodacenter.github.io/data-and-lab/ncovr/}
## No test: 
## It usually requires 1-2 minutes maximum...
rm(list = ls()) # Clean memory
data(NCOVR)
Tformula <- HR80  | HR90 ~ PS80 + UE80 | PS90 + UE90
## A SUR-SIM model
NCOVRSUR.sim <-spsurml(Form = Tformula, data = NCOVR, type = "sim", W = W)
summary(NCOVRSUR.sim)
rm(NCOVRSUR.sim)

## A SUR-SLX model
NCOVRSUR.slx <-spsurml(Form = Tformula, data = NCOVR, type = "slx", W = W)
summary(NCOVRSUR.slx)
rm(NCOVRSUR.slx)
## End(No test)
## No test: 
## It usually requires 1-2 minutes maximum...
## A SUR-SLM model
NCOVRSUR.slm <-spsurml(Form = Tformula, data = NCOVR, type = "slm", W = W)
summary(NCOVRSUR.slm)
rm(NCOVRSUR.slm)

## A SUR-SDM model
NCOVRSUR.sdm <-spsurml(Form = Tformula, data = NCOVR, type = "sdm", W = W)
summary(NCOVRSUR.sdm)
rm(NCOVRSUR.sdm)

## A SUR-SEM model
NCOVRSUR.sem <-spsurml(Form = Tformula, data = NCOVR, type = "sem", W = W)
summary(NCOVRSUR.sem)
## A SUR-SDEM model
NCOVRSUR.sdem <-spsurml(Form = Tformula, data = NCOVR, type = "sdem",W = W)
summary(NCOVRSUR.sdem)

## A SUR-SARAR model
NCOVRSUR.sarar <-spsurml(Form = Tformula, data = NCOVR,
                          type = "sarar", W = W)
 summary(NCOVRSUR.sarar)
## End(No test)

##############################################
######## SUR with G>1; Tm>1  ###
##############################################
## No test: 
## It usually requires 2-3 minutes maximum...
rm(list = ls())  # Clean memory
#### Reshape NCOVR in panel format
data(NCOVR,package="spsur")
N <- nrow(NCOVR)
Tm <- 4
index_time <- rep(1:Tm, each = N)
index_indiv <- rep(1:N, Tm)
pHR <- c(NCOVR$HR60, NCOVR$HR70, NCOVR$HR80, NCOVR$HR90)
pPS <- c(NCOVR$PS60, NCOVR$PS70, NCOVR$PS80, NCOVR$PS90)
pUE <- c(NCOVR$UE60, NCOVR$UE70, NCOVR$UE80, NCOVR$UE90)
pDV <- c(NCOVR $DV60, NCOVR$DV70, NCOVR$DV80, NCOVR$DV90)
pFP <- c(NCOVR$FP59, NCOVR$FP70, NCOVR$FP80, NCOVR$FP90)
pSOUTH <- rep(NCOVR$SOUTH, Tm)
pNCOVR <- data.frame(indiv = index_indiv, time = index_time,
                     HR = pHR, PS = pPS, UE = pUE, DV = pDV,
                     FP = pFP, SOUTH = pSOUTH)
rm(NCOVR) # Free memory...
pform <- HR | DV | FP ~ PS + UE | PS + UE + SOUTH | PS

## SIM (easy to compute...)

psur_sim <- spsurml(Form = pform, data = pNCOVR, W = W, type = "sim")
summary(psur_sim)

## SLM (cov = FALSE to prevent overflows of memory)
psur_slm <- spsurml(Form = pform, data = pNCOVR, W = W,
                        type = "slm", cov = FALSE)
psur_slm$deltas
psur_slm$betas
psur_slm$Sigma_corr
rm(psur_slm)
## SEM (cov = FALSE to prevent overflows of memory)
### Only execute if you have enough memory...
psur_sem <- spsurml(Form = pform, data = pNCOVR, W = W,
                        type = "sem", cov = FALSE)
psur_sem$deltas
psur_sem$betas
psur_sem$Sigma_corr
psur_sem
## End(No test)

##############################################
######## Demeaning Examples with G>1; Tm>>1  ###
##############################################
## No test: 
#' rm(list = ls())  # Clean memory
set.seed(123456)
Tm <- 10 # Number of time periods
G <- 3 # Number of equations
N <- 100 # Number of spatial elements
p <- 3 # Number of independent variables
Sigma <- matrix(0.5, ncol = G, nrow = G)
diag(Sigma) <- 1
Betas <- rep(1:3, G)
lambda <- 0.5
rho <- 0.0 # spatial autocorrelation error term = 0
#  random coordinates
co <- cbind(runif(N,0,1),runif(N,0,1))
W <- spdep::nb2mat(spdep::knn2nb(spdep::knearneigh(co, k = 5, longlat = FALSE)))
DGPsim <- dgp_spsur(Sigma = Sigma, Betas = Betas, rho = rho, lambda = lambda,
                 Tm = Tm, G = G, N = N, p = p, W = W)

## SLM without demeaning

SUR_slm  <-spsurml(Y= DGPsim$Y, X = DGPsim$X, G = G, N = N, Tm = Tm,
                  p = p, W = W, type = "slm")
summary(SUR_slm)

# SLM with demeaning

SUR_slm_dem  <-spsurml(Y= DGPsim$Y, X = DGPsim$X, G = G, N = N, Tm = Tm,
                  p = p, W = W, type = "slm", demean = TRUE)
summary(SUR_slm_dem)
## End(No test)




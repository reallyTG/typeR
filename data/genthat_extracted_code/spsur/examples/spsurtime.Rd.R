library(spsur)


### Name: spsurtime
### Title: Estimation of SUR models for simple spatial panels (G=1).
### Aliases: spsurtime

### ** Examples


####################################
######## PANEL DATA (G=1; Tm>1) ###
####################################

## Example 1:
rm(list = ls()) # Clean memory
N <- nrow(spc)
Tm <- 2
index_time <- rep(1:Tm, each = N)
index_indiv <- rep(1:N, Tm)
WAGE <- c(spc$WAGE83, spc$WAGE81)
UN <- c(spc$UN83, spc$UN80)
NMR <- c(spc$NMR83, spc$NMR80)
SMSA <- c(spc$SMSA, spc$SMSA)
pspc <- data.frame(index_indiv,index_time,WAGE,UN,NMR,SMSA)
form_pspc <- WAGE ~ UN + NMR + SMSA

# SLM by 3SLS
pspc_slm <- spsurtime(Form = form_pspc, data = pspc, W = Wspc,
                      time = pspc$index_time, type = "slm", method = "3sls")
                      summary(pspc_slm)
## No test: 
## Example 2:
rm(list = ls()) # Clean memory
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
rm(NCOVR)
form_pHR <- HR ~ PS + UE

# SIM by ML

## pHR_sim <- spsurtime(Form = form_pHR, data = pNCOVR, W = W,
##                    time = pNCOVR$time, type = "sim", method = "ml")
## summary(pHR_sim)

# SLM by 3SLS

pHR_slm <- spsurtime(Form = form_pHR, data = pNCOVR, W = W,
                     time = pNCOVR$time, type = "slm", method = "3sls")
summary(pHR_slm)

############################ LR tests about betas in spatio-temporal models

## Usually takes less than 1 minute
## H0: equal PS and UE beta in equations 3 and 4 al
R <- matrix(0,nrow=2,ncol=12)
R[1,8] <- 1; R[1,11] <- -1
R[2,9] <- 1; R[2,12] <- -1
b <- matrix(0, nrow = 2, ncol = 1)
lr_partrate <-  lr_betas_spsur(Form = form_pHR, data = pNCOVR,
                               time = pNCOVR$time, W = W,
                               type = "sim", R = R, b = b, trace = TRUE,
                               printmodels = TRUE)

############################ Wald tests about betas in spatio-temporal models
wald_betas(pHR_sim , R = R , b = b) # SIM model
wald_betas(pHR_slm , R = R , b = b) # SLM model
############################ Wald tests about spatial-parameters in
############################ spatio-temporal models
## H0: equal lambdas in slm model for equations 1 and 2.
R2 <- matrix(0, nrow = 1, ncol = 4)
R2[1,1] <- 1; R2[1,2] <- -1
b2 <- matrix(0, nrow = 1, ncol = 1)
wald_deltas(pHR_slm, R = R2, b = b2)
## End(No test)





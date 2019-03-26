library(spsur)


### Name: lr_betas_spsur
### Title: Likelihood ratio for testing homogeneity constraints on beta
###   coefficients of the SUR equations.
### Aliases: lr_betas_spsur

### ** Examples

#################################################
######## CROSS SECTION DATA (G>1; Tm=1)  ########
#################################################

#### Example 1: Spatial Phillips-Curve. Anselin (1988, p. 203)
rm(list = ls()) # Clean memory
data(spc)
Tformula <- WAGE83 | WAGE81 ~ UN83 + NMR83 + SMSA | UN80 + NMR80 + SMSA
## H0: equal beta for SMSA in both equations.
R <- matrix(c(0,0,0,1,0,0,0,-1),nrow=1)
b <- matrix(0,ncol=1)
LR_SMSA <-  lr_betas_spsur(Form = Tformula, data = spc, W = Wspc,
                           type = "sim", R = R, b = b, trace = TRUE,
                           printmodels = TRUE)

################################################
####### PANEL DATA (G>1; Tm>1)          ########
################################################

#### Example 2: Homicides + Socio-Economics (1960-90)
# Homicides and selected socio-economic characteristics for continental
# U.S. counties.
# Data for four decennial census years: 1960, 1970, 1980 and 1990.
# \url{https://geodacenter.github.io/data-and-lab/ncovr/}
## No test: 
## It usually requires 1-2 minutes maximum
rm(list = ls()) # Clean memory
data(NCOVR)
Tformula <- HR80  | HR90 ~ PS80 + UE80 | PS90 + UE90
## H0: equal beta for PS80 and PS90 in both equations.
R <- matrix(c(0,1,0,0,-1,0),nrow=1)
b <- matrix(0,ncol=1)
LR_PS <-  lr_betas_spsur(Form = Tformula, data = NCOVR, W = W,
                        type = 'slm', R = R, b = b, printmodels = FALSE)

## End(No test)
################################################################
######## PANEL DATA: TEMPORAL CORRELATIONS (nG=1; nT>1) ########
################################################################
## Example 3: with classical panel data set. Database is
##            a spatio-temporal panel
## No test: 
### Only execute if you have enough memory...
rm(list = ls()) # Clean memory
data(NCOVR)
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
# H0: equal PS beta coefficient in equations 1, 3, and 4
R <- matrix(0,nrow=2,ncol=12) # nrow = number of restrictions ; ncol = number of beta parameters
R[1,2] <- 1; R[1,8] <- -1 # PS beta coefficient in equations 1 equal to 3
R[2,2] <- 1; R[2,11] <- -1 # PS beta coefficient in equations 1 equal to 4
b <- matrix(0,nrow=2,ncol=1)
lr_partrate <-  lr_betas_spsur(Form = form_pHR, data = pNCOVR,
                               time = pNCOVR$time, W = W,
                               type = "slm", R = R, b = b, trace = TRUE,
                               printmodels = FALSE)
## End(No test)




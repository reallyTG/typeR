library(DDPGPSurv)


### Name: mcmc_DDPGP
### Title: Gibbs Sampling MCMC function
### Aliases: mcmc_DDPGP

### ** Examples

########################################
#Source dependent packages
library(MASS)
library(mc2d)
library(mvnfast)
library(survival)
#Simulate Data using built-in data generation
##
seed=1
set.seed(seed)
Npat=5
data <- simulate_data(Npat)

########################################
#Run MCMC 
########################################
#Inputs for mcmc 
response <- log(data$OS)
covariate <- cbind(scale(data$Age),data$AUC,data$CR)
censor_status <- data$death
mcmc_settings<-NULL
mcmc_settings$nskip<-10
mcmc_settings$nburn<-50
mcmc_settings$ndisplay<-100
mcmc_settings$nsave<-20
mcmc_settings$sigma_jump<-c(0,4,2.5,4,2.6)
###################
#Run MCMC function
mcmc_Gibbs<-mcmc_DDPGP(response,covariate,censor_status,mcmc_settings)
########################################
#Plotting Density/Survival/Hazard Estimation 
########################################





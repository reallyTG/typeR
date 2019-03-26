library(DDPGPSurv)


### Name: DDPGPSurv-package
### Title: DDP-GP Survival Analysis Package
### Aliases: DDPGPSurv-package DDPGPSurv

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
#Parameters in Plotting Estimation for Functions 
range=seq(2,8,1)
example_AUC <- 5
example_CR <- 1
example_Age <- 0
new_pat<-cbind(example_Age,example_AUC,example_CR)
if_plot=1
###################
#Plot DDP-GP Density Esimation
a=DDPGP_Dens(mcmc_Gibbs,new_pat,range, if_plot)

#Plot DDP-GP Survival Esimation
b=DDPGP_Surv(mcmc_Gibbs,new_pat,range, if_plot)

#Plot DDP-GP Hazard Esimation
c=DDPGP_Haz(mcmc_Gibbs,new_pat,range, if_plot)
########################################
#Plotting Mean Survival Estimation 
########################################
#Parameters in Plotting Mean Survival Estimation 
range_AUC <- seq(2.6, 7, 0.1)
new_pat_1<-cbind(example_Age,range_AUC,example_CR)
if_plot=1
DDPGP_mean<-DDPGP_meansurvival(mcmc_Gibbs,new_pat_1,if_plot,cov_col=2)




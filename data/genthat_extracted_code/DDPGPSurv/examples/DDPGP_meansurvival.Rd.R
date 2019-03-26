library(DDPGPSurv)


### Name: DDPGP_meansurvival
### Title: Posterior mean survival estimation using Gibbs MCMC Outputs
### Aliases: DDPGP_meansurvival

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
#Plotting Mean Survival Estimation 
########################################
#Parameters in Plotting Mean Survival Estimation 
example_CR <- 1
example_Age <- 1
range_AUC <- seq(2.6, 7, 0.1)
new_pat_1<-cbind(example_Age,range_AUC,example_CR)
if_plot=1
DPGP_mean<-DDPGP_meansurvival(mcmc_Gibbs,new_pat_1,if_plot,cov_col=2)





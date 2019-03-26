library(SurvBoost)


### Name: simulate_survival_cox
### Title: Simulating survival data
### Aliases: simulate_survival_cox
### Keywords: boosting gradient

### ** Examples

toyData <- simulate_survival_cox(true_beta=c(1,1,1,1,1,0,0,0,0,0), 
base_hazard="weibull", base_hazard_scale=rep(1,5), base_hazard_shape=rep(2,5), 
num_strata=5, input_strata_size=100, cov_structure="diag", block_size=2, 
rho=0.3, censor_dist="unif", censor_const=5, tau=Inf, normalized=FALSE)
any(duplicated(toyData$time))
z <- as.matrix(toyData[,-c(1,2,3)])






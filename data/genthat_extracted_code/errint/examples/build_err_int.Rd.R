library(errint)


### Name: int_lap
### Title: Building Error Intervals
### Aliases: int_beta int_gau int_gau_mu int_lap int_lap_mu int_moge
###   int_weibull

### ** Examples

int_lap(rnorm(10),0.1)


int_gau(rnorm(10),0.1,0.1,10^-3,10^2)


int_lap_mu(rnorm(10),0.1,0.1,10^-3,10^2)


int_gau_mu(rnorm(10),0.1,0.1,10^-3,10^2)


int_beta(runif(10,0,0.99),0.1,alpha_0=1,beta_0=1)


int_weibull(abs(rnorm(10)),0.1,k_0=2)


int_moge(runif(10,0.01,0.99),0.1,lambda_0=2,alpha_0=3,theta_0=4)




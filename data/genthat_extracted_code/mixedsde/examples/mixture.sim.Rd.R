library(mixedsde)


### Name: mixture.sim
### Title: Simulation Of A Mixture Of Two Normal Or Gamma Distributions
### Aliases: mixture.sim

### ** Examples

density.phi <- 'mixture.gamma'
param <- c(0.2,1.8,0.5,5.05,1); M <- 200
gridf <- seq(0, 8, length = 200)  
f <- param[1] * 1/gamma(param[2]) * (gridf)^(param[2]-1) * 
           exp(-(gridf) / param[3]) / param[3]^param[2] + 
           (1-param[1]) * 1/gamma(param[4]) * (gridf)^(param[4]-1) * 
           exp(-(gridf) / param[5]) / param[5]^param[4]
Y <- mixture.sim(M, density.phi, param)
hist(Y)
lines(gridf, f)




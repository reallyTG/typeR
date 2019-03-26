library(emdbook)


### Name: HPDregionplot
### Title: Plot highest posterior density region
### Aliases: HPDregionplot
### Keywords: hplot

### ** Examples

library(MASS)
library(coda)
z <- mvrnorm(1000,mu=c(0,0),Sigma=matrix(c(2,1,1,2),nrow=2))
z2 <- mvrnorm(1000,mu=c(0,0),Sigma=matrix(c(2,1,1,2),nrow=2))
HPDregionplot(mcmc(z))
HPDregionplot(mcmc.list(mcmc(z),mcmc(z2)))




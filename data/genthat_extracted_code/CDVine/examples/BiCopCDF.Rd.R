library(CDVine)


### Name: BiCopCDF
### Title: Distribution function of a bivariate copula
### Aliases: BiCopCDF

### ** Examples

# simulate from a bivariate t-copula
simdata = BiCopSim(300,2,-0.7,par2=4)

# evaluate the distribution function of the bivariate t-copula
u1 = simdata[,1]
u2 = simdata[,2]
BiCopCDF(u1,u2,2,-0.7,par2=4)




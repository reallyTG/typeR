library(CDVine)


### Name: BiCopPDF
### Title: Density of a bivariate copula
### Aliases: BiCopPDF

### ** Examples

# simulate from a bivariate t-copula
simdata = BiCopSim(300,2,-0.7,par2=4)

# evaluate the density of the bivariate t-copula
u1 = simdata[,1]
u2 = simdata[,2]
BiCopPDF(u1,u2,2,-0.7,par2=4)




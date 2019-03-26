library(REPPlab)


### Name: fitted.epplab
### Title: Calculates projections of the Data
### Aliases: fitted,epplab-method fitted-method fitted.epplab
### Keywords: methods print

### ** Examples


library(tourr)
data(olive)
res <- EPPlab(olive[,3:10],PPalg="PSO",PPindex="KurtosisMin",n.simu=10, maxiter=20)

# Projection to the best direction
fitted(res)

# Projection to the 1,2,5 best directions:
fitted(res,which=c(1,2,5))





library(REPPlab)


### Name: coef.epplab
### Title: Extracts the Directions of an Epplab Object
### Aliases: coef,epplab-method coef-method coef.epplab
### Keywords: methods print

### ** Examples


library(tourr)
data(olive)
res <- EPPlab(olive[,3:10],PPalg="PSO",PPindex="KurtosisMin",n.simu=10, maxiter=20)
coef(res)





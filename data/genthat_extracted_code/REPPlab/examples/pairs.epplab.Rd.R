library(REPPlab)


### Name: pairs.epplab
### Title: Plots a Scatterplot Matrix for an epplab Object
### Aliases: pairs,epplab-method pairs-method pairs.epplab
### Keywords: hplot methods

### ** Examples


library(tourr)
data(olive)
res <- EPPlab(olive[,3:10],PPalg="PSO",PPindex="KurtosisMin",n.simu=10, maxiter=20)
pairs(res)





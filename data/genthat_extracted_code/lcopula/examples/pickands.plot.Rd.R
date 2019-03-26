library(lcopula)


### Name: pickands.plot
### Title: Plot Pickands dependence function for CDA of Liouville copulas
### Aliases: pickands.plot

### ** Examples

pickands.plot(rho=0.9, alpha=c(1,1), col="slateblue1", CDA="C")
pickands.plot(rho=0.9, alpha=c(2,3), col="slateblue2", CDA="C", plot.new=FALSE)
pickands.plot(rho=0.5, alpha=c(2,3), col="slateblue3", CDA="C", plot.new=FALSE)
#Parameters for the Pickands function of the scaled Dirichlet need not be integer
pickands.plot(rho=0.9, alpha=c(1,1), CDA="S")
pickands.plot(rho=0.9, alpha=c(0.2,0.5), col="darkred", CDA="S", plot.new=FALSE)
pickands.plot(rho=0.8, alpha=c(1.2,0.1), col="red", CDA="S", plot.new=FALSE)




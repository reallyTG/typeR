library(SimEUCartelLaw)


### Name: NoRglPlot
### Title: Visualize results of simulation of legal exemption system
### Aliases: NoRglPlot

### ** Examples

## No test: 
Par <- list(Phi=c(0.1,0.5), Rho=c(0.5,0.9), Ksi=c(0.05,0.3), Chi=c(0.1,0.4),
            M=c(0.2,1.2), G=c(0.05,0.2), A=c(0.1,0.3))
NoRglPlot(LEgame(params=Par, m=10000))
## End(No test)




library(SimEUCartelLaw)


### Name: SimEUCartelLaw
### Title: Simulation of Legal Exemption System for European Cartel Law
### Aliases: SimEUCartelLaw SimEUCartelLaw-package

### ** Examples

Par <- list(Phi=c(0.1,0.5), Rho=c(0.5,0.9), Ksi=c(0.05,0.3), Chi=c(0.1,0.4),
            M=c(0.2,1.2), G=c(0.05,0.2), A=c(0.1,0.3))
res <- LEgame(params=Par,m=100000)
print(aggResults(res))
print(CorrStudy(params=Par, m=10000))
print(CorrStudySplit(params=Par, m=10000))
## No test: 
RglPlot(LEgame(params=Par, m=10000))
NoRglPlot(LEgame(params=Par, m=10000))
## End(No test)





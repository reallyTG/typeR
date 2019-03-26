library(StrainRanking)


### Name: gmcpic.test
### Title: Function implementing the Generalized Monte Carlo plug-in test
###   with calibration (GMCPIC test)
### Aliases: gmcpic.test
### Keywords: misc

### ** Examples

## Load Pathogen Compositions of M. oryzae collected in Madagascar
data(PathogenCompositionMoryzaeMadagascar)
x=t(PathogenCompositionMoryzaeMadagascar)

## Apply the GMCPIC test (use B=10^3, M=10^4 to get a robust result)
## No test: 
testMada=gmcpic.test(x, B=10^2, M=10^3, weights=seq(0.5,0.99,by=0.01),threshold=0.05)
## End(No test)
## No test: 
testMada
## End(No test)

## Apply the Chi-squared test
chisq.test(x, simulate.p.value = TRUE, B = 10000)




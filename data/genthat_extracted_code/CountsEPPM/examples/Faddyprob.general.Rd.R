library(CountsEPPM)


### Name: Faddyprob.general
### Title: Calculation of vector of probabilities for a Faddy distribution.
### Aliases: Faddyprob.general
### Keywords: distribution

### ** Examples

all.counts=c(rep(0,5),352,479,530,291,101,17)
nmax   <- length(all.counts) - 1
parameter <- c(exp(53.047752),exp(3.801599),-13.205655)
names(parameter) <- c("a","b","c") 
probability <- Faddyprob.general(parameter,nmax) 
print(probability)




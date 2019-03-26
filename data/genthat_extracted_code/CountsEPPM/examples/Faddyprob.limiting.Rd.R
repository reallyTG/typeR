library(CountsEPPM)


### Name: Faddyprob.limiting
### Title: Calculation of vector of probabilities for the limiting form of
###   the Faddy distribution.
### Aliases: Faddyprob.limiting
### Keywords: distribution

### ** Examples

all.counts=c(rep(0,5),352,479,530,291,101,17)
nmax1  <- length(all.counts)
nmax   <- nmax1 - 1
parameter <- c(1.8388023,0.6009881)
names(parameter) <- c("beta0 log(mean)","beta0 log(variance)") 
probability <- Faddyprob.limiting(parameter,nmax) 
print(probability)




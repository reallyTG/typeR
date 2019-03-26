library(fitODBOD)


### Name: EstMLECorrBin
### Title: Estimating the probability of success and correlation for
###   Correlated Binomial Distribution
### Aliases: EstMLECorrBin

### ** Examples

No.D.D=0:7               #assigning the random variables
Obs.fre.1=c(47,54,43,40,40,41,39,95)     #assigning the corresponding frequencies

#estimating the parameters using maximum log likelihood value and assigning it
parameters=suppressWarnings(bbmle::mle2(EstMLECorrBin,start = list(p=0.5,cov=0.0050),
                       data = list(x=No.D.D,freq=Obs.fre.1)))
bbmle::coef(parameters)           #extracting the parameters





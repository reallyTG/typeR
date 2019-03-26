library(fitODBOD)


### Name: EstMLECOMPBin
### Title: Estimating the probability of success and v parameter for COM
###   Poisson Binomial Distribution
### Aliases: EstMLECOMPBin

### ** Examples

No.D.D=0:7               #assigning the random variables
Obs.fre.1=c(47,54,43,40,40,41,39,95)     #assigning the corresponding frequencies

#estimating the parameters using maximum log likelihood value and assigning it
parameters=suppressWarnings(bbmle::mle2(EstMLECOMPBin,start = list(p=0.5,v=0.1),
                       data = list(x=No.D.D,freq=Obs.fre.1)))
bbmle::coef(parameters)           #extracting the parameters





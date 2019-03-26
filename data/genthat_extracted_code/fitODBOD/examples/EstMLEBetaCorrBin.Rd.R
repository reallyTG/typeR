library(fitODBOD)


### Name: EstMLEBetaCorrBin
### Title: Estimating the covariance, alpha and beta parameter values for
###   Beta-Correlated Binomial Distribution
### Aliases: EstMLEBetaCorrBin

### ** Examples

No.D.D=0:7               #assigning the random variables
Obs.fre.1=c(47,54,43,40,40,41,39,95)     #assigning the corresponding frequencies

#estimating the parameters using maximum log likelihood value and assigning it
parameters=suppressWarnings(bbmle::mle2(EstMLEBetaCorrBin,start = list(cov=0.0050,a=10,b=10),
                       data = list(x=No.D.D,freq=Obs.fre.1)))
bbmle::coef(parameters)           #extracting the parameters





library(fitODBOD)


### Name: EstMLEGHGBB
### Title: Estimating the shape parameters a,b and c for Gaussian
###   Hypergeometric Generalized Beta Binomial Distribution
### Aliases: EstMLEGHGBB

### ** Examples

No.D.D=0:7           #assigning the random variables
Obs.fre.1=c(47,54,43,40,40,41,39,95)     #assigning the corresponding frequencies
#estimating the parameters using maximum log likelihood value and assigning it
parameters=suppressWarnings(bbmle::mle2(EstMLEGHGBB,start = list(a=0.1,b=0.1,c=0.2),
data = list(x=No.D.D,freq=Obs.fre.1)))
bbmle::coef(parameters)   #extracting the parameters





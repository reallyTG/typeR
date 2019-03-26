library(fitODBOD)


### Name: EstMGFBetaBin
### Title: Estimating the shape parameters a and b for Beta-Binomial
###   Distribution
### Aliases: EstMGFBetaBin

### ** Examples

No.D.D=0:7        #assigning the random variables
Obs.fre.1=c(47,54,43,40,40,41,39,95)   #assigning the corresponding frequencies
#estimating the parameters using maximum log likelihood value and assigning it
parameters=suppressWarnings(bbmle::mle2(EstMLEBetaBin,start = list(a=0.1,b=0.1),
data = list(x=No.D.D,freq=Obs.fre.1)))
bbmle::coef(parameters)   #extracting the parameters

#estimating the parameters using moment generating function methods
EstMGFBetaBin(No.D.D,Obs.fre.1)





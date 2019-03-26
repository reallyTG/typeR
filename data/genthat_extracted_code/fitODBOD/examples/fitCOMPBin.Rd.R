library(fitODBOD)


### Name: fitCOMPBin
### Title: Fitting the COM Poisson Binomial Distribution when binomial
###   random variable, frequency, probability of success and v parameter
###   are given
### Aliases: fitCOMPBin

### ** Examples

No.D.D=0:7                    #assigning the random variables
Obs.fre.1=c(47,54,43,40,40,41,39,95)      #assigning the corresponding frequencies

#estimating the parameters using maximum log likelihood value and assigning it
parameters=suppressWarnings(bbmle::mle2(EstMLECOMPBin,start = list(p=0.5,v=0.050),
           data = list(x=No.D.D,freq=Obs.fre.1)))
pCOMPBin=bbmle::coef(parameters)[1]
vCOMPBin=bbmle::coef(parameters)[2]
#fitting when the random variable,frequencies,probability and v parameter are given
fitCOMPBin(No.D.D,Obs.fre.1,pCOMPBin,vCOMPBin)
#extracting the expected frequencies
fitCOMPBin(No.D.D,Obs.fre.1,pCOMPBin,vCOMPBin,FALSE)$exp.freq




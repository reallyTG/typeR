library(fitODBOD)


### Name: fitCorrBin
### Title: Fitting the Correlated Binomial Distribution when binomial
###   random variable, frequency, probability of success and covariance are
###   given
### Aliases: fitCorrBin

### ** Examples

No.D.D=0:7                    #assigning the random variables
Obs.fre.1=c(47,54,43,40,40,41,39,95)      #assigning the corresponding frequencies

#estimating the parameters using maximum log likelihood value and assigning it
parameters=suppressWarnings(bbmle::mle2(EstMLECorrBin,start = list(p=0.5,cov=0.0050),
           data = list(x=No.D.D,freq=Obs.fre.1)))
pCorrBin=bbmle::coef(parameters)[1]
covCorrBin=bbmle::coef(parameters)[2]
#fitting when the random variable,frequencies,probability and covariance are given
fitCorrBin(No.D.D,Obs.fre.1,pCorrBin,covCorrBin)
#extracting the expected frequencies
fitCorrBin(No.D.D,Obs.fre.1,pCorrBin,covCorrBin,FALSE)$exp.freq




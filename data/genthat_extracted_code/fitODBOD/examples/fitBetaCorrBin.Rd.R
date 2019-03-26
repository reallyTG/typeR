library(fitODBOD)


### Name: fitBetaCorrBin
### Title: Fitting the Beta-Correlated Binomial Distribution when binomial
###   random variable, frequency, covariance, alpha and beta parameters are
###   given
### Aliases: fitBetaCorrBin

### ** Examples

No.D.D=0:7                    #assigning the random variables
Obs.fre.1=c(47,54,43,40,40,41,39,95)      #assigning the corresponding frequencies

#estimating the parameters using maximum log likelihood value and assigning it
parameters=suppressWarnings(bbmle::mle2(EstMLEBetaCorrBin,start = list(cov=0.0050,a=10,b=10),
           data = list(x=No.D.D,freq=Obs.fre.1)))
covBetaCorrBin=bbmle::coef(parameters)[1]
aBetaCorrBin=bbmle::coef(parameters)[2]
bBetaCorrBin=bbmle::coef(parameters)[3]
#fitting when the random variable,frequencies,covariance, a and b are given
fitBetaCorrBin(No.D.D,Obs.fre.1,covBetaCorrBin,aBetaCorrBin,bBetaCorrBin)
#extracting the expected frequencies
fitBetaCorrBin(No.D.D,Obs.fre.1,covBetaCorrBin,aBetaCorrBin,bBetaCorrBin,FALSE)$exp.freq




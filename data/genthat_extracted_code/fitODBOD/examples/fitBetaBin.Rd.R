library(fitODBOD)


### Name: fitBetaBin
### Title: Fitting the Beta-Binomial Distribution when binomial random
###   variable, frequency and shape parameters a and b are given
### Aliases: fitBetaBin

### ** Examples

No.D.D=0:7    #assigning the random variables
Obs.fre.1=c(47,54,43,40,40,41,39,95)  #assigning the corresponding frequencies
#estimating the parameters using maximum log likelihood value and assigning it
parameters=suppressWarnings(bbmle::mle2(EstMLEBetaBin,start = list(a=0.1,b=0.1),
data = list(x=No.D.D,freq=Obs.fre.1)))
bbmle::coef(parameters)   #extracting the parameters a and b
aBetaBin=bbmle::coef(parameters)[1]  #assigning the parameter a
bBetaBin=bbmle::coef(parameters)[2]  #assigning the parameter b
#fitting when the random variable,frequencies,shape parameter values are given.
fitBetaBin(No.D.D,Obs.fre.1,aBetaBin,bBetaBin)

#estimating the parameters using moment generating function methods
EstMGFBetaBin(No.D.D,Obs.fre.1)
aBetaBin1=EstMGFBetaBin(No.D.D,Obs.fre.1)$a  #assigning the estimated a
bBetaBin1=EstMGFBetaBin(No.D.D,Obs.fre.1)$b  #assigning the estimated b
#fitting when the random variable,frequencies,shape parameter values are given.
fitBetaBin(No.D.D,Obs.fre.1,aBetaBin1,bBetaBin1)
#extracting the expected frequencies
fitBetaBin(No.D.D,Obs.fre.1,aBetaBin1,bBetaBin1,FALSE)$exp.freq




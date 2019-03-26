library(fitODBOD)


### Name: fitMultiBin
### Title: Fitting the Multiplicative Binomial Distribution when binomial
###   random variable, frequency, probability of success and theta
###   parameter are given
### Aliases: fitMultiBin

### ** Examples

No.D.D=0:7       #assigning the random variables
Obs.fre.1=c(47,54,43,40,40,41,39,95)     #assigning the corresponding frequencies
#estimating the parameters using maximum log likelihood value and assigning it
parameters=suppressWarnings(bbmle::mle2(EstMLEMultiBin,start = list(p=0.1,theta=.3),
          data = list(x=No.D.D,freq=Obs.fre.1)))
pMultiBin=bbmle::coef(parameters)[1]    #assigning the estimated probability value
thetaMultiBin=bbmle::coef(parameters)[2]  #assigning the estimated theta value

#fitting when the random variable,frequencies,probability and theta are given
fitMultiBin(No.D.D,Obs.fre.1,pMultiBin,thetaMultiBin)

#extracting the expected frequencies
fitMultiBin(No.D.D,Obs.fre.1,pMultiBin,thetaMultiBin,FALSE)$exp.freq




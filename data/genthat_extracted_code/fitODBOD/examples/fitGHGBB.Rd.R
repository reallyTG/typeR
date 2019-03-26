library(fitODBOD)


### Name: fitGHGBB
### Title: Fitting the Gaussian Hypergeometric Generalized Beta Binomial
###   Distribution when binomial random variable, frequency and shape
###   parameters a,b and c are given
### Aliases: fitGHGBB

### ** Examples

No.D.D=0:7        #assigning the random variables
Obs.fre.1=c(47,54,43,40,40,41,39,95)       #assigning the corresponding frequencies
#estimating the parameters using maximum log likelihood value and assigning it
parameters=suppressWarnings(bbmle::mle2(EstMLEGHGBB,start = list(a=0.1,b=0.1,c=0.2),
data = list(x=No.D.D,freq=Obs.fre.1)))
bbmle::coef(parameters)         #extracting the parameters
aGHGBB=bbmle::coef(parameters)[1]  #assigning the estimated a
bGHGBB=bbmle::coef(parameters)[2]  #assigning the estimated b
cGHGBB=bbmle::coef(parameters)[3]  #assigning the estimated c

#fitting when the random variable,frequencies,shape parameter values are given.
fitGHGBB(No.D.D,Obs.fre.1,aGHGBB,bGHGBB,cGHGBB)
#extracting the expected frequencies
fitGHGBB(No.D.D,Obs.fre.1,aGHGBB,bGHGBB,cGHGBB,FALSE)$exp.freq




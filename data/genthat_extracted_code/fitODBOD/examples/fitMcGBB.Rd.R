library(fitODBOD)


### Name: fitMcGBB
### Title: Fitting the McDonald Generalized beta binomial distribution when
###   binomial random variable, frequency and shape parameters are given
### Aliases: fitMcGBB

### ** Examples

No.D.D=0:7       #assigning the random variables
Obs.fre.1=c(47,54,43,40,40,41,39,95)          #assigning the corresponding frequencies
#estimating the parameters using maximum log likelihood value and assigning it
## Not run: 
##D parameters=suppressWarnings(bbmle::mle2(EstMLEMcGBB,start = list(a=0.1,b=0.1,c=0.2),
##D data = list(x=No.D.D,freq=Obs.fre.1)))
##D aMcGBB=bbmle::coef(parameters)[1]         #assigning the estimated a
##D bMcGBB=bbmle::coef(parameters)[2]         #assigning the estimated b
##D cMcGBB=bbmle::coef(parameters)[3]         #assigning the estimated c
##D 
##D #fitting when the random variable,frequencies,shape parameter values are given.
##D fitMcGBB(No.D.D,Obs.fre.1,aMcGBB,bMcGBB,cMcGBB)
##D #extracting the expected frequencies
##D fitMcGBB(No.D.D,Obs.fre.1,aMcGBB,bMcGBB,cMcGBB,FALSE)$exp.freq
## End(Not run)




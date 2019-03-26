library(fitODBOD)


### Name: fitKumBin
### Title: Fitting the Kumaraswamy Binomial Distribution when binomial
###   random variable, frequency and shape parameters 'a' and 'b',
###   iterations parameter 'it' are given
### Aliases: fitKumBin

### ** Examples

No.D.D=0:7   #assigning the random variables
Obs.fre.1=c(47,54,43,40,40,41,39,95)   #assigning the corresponding frequencies
#estimating the parameters using maximum log likelihood value and assigning it
## Not run: 
##D parameters=suppressWarnings(bbmle::mle2(EstMLEKumBin,start = list(a=10.1,b=1.1,it=10000),
##D           data = list(x=No.D.D,freq=Obs.fre.1)))
##D bbmle::coef(parameters)    #extracting the parameters
##D aKumBin=bbmle::coef(parameters)[1] #assigning the estimated a
##D bKumBin=bbmle::coef(parameters)[2] #assigning the estimated b
##D itKumBin=bbmle::coef(parameters)[3] #assigning the estimated iterations
##D 
##D #fitting when the random variable,frequencies,shape parameter values are given.
##D fitKumBin(No.D.D,Obs.fre.1,aKumBin,bKumBin,itKumBin*100)
## End(Not run)





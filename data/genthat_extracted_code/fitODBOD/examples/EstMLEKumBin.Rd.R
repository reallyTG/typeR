library(fitODBOD)


### Name: EstMLEKumBin
### Title: Estimating the shape parameters a and b and iterations for
###   Kumaraswamy Binomial Distribution
### Aliases: EstMLEKumBin

### ** Examples

No.D.D=0:7     #assigning the random variables
Obs.fre.1=c(47,54,43,40,40,41,39,95)  #assigning the corresponding frequencies
#estimating the parameters using maximum log likelihood value and assigning it
## Not run: 
##D parameters1=suppressWarnings(bbmle::mle2(EstMLEKumBin,start = list(a=10.1,b=1.1,it=10000),
##D data = list(x=No.D.D,freq=Obs.fre.1)))
##D bbmle::coef(parameters1)   #extracting the parameters
## End(Not run)





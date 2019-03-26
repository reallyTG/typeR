library(fitODBOD)


### Name: EstMLEMcGBB
### Title: Estimating the shape parameters a,b and c for McDonald
###   Generalized Beta Binomial distribution
### Aliases: EstMLEMcGBB

### ** Examples

No.D.D=0:7                   #assigning the random variables
Obs.fre.1=c(47,54,43,40,40,41,39,95)  #assigning the corresponding frequencies
#estimating the parameters using maximum log likelihood value and assigning it
## Not run: 
##D parameters=suppressWarnings(bbmle::mle2(EstMLEMcGBB,start = list(a=0.1,b=0.1,c=0.2),
##D           data = list(x=No.D.D,freq=Obs.fre.1)))
##D bbmle::coef(parameters)         #extracting the parameters
## End(Not run)




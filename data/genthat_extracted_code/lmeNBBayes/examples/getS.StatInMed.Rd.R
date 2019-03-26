library(lmeNBBayes)


### Name: getS.StatInMed
### Title: Generate samples from the flexible mixed-effect negative
###   binomial distribution
### Aliases: getS.StatInMed
### Keywords: ~kwd1 ~kwd2

### ** Examples


## Not run: 
##D 
##D ## See the full informative prior for beta
##D temp <- getS.StatInMed(mod=3,Scenario="full")
##D temp$mu_beta
##D temp$Sigma_beta
##D 
##D ## See the SPMS informative prior for beta
##D temp <- getS.StatInMed(mod=3,Scenario="SPMS")
##D temp$mu_beta
##D temp$Sigma_beta
##D 
##D ## See also the examples in lmeNBBayes
## End(Not run)





library(RobustAFT)


### Name: TML1.noncensored
### Title: Truncated Maximum Likelihood Estimates of Location and Scale
### Aliases: TML1.noncensored
### Keywords: robust regression univar Accelerated Failure Time

### ** Examples


## Not run: 
##D       data(Z243)
##D       Cost <- Z243$CouTot                         
##D       y    <- log(Cost)
##D       ctrl <- TML1.noncensored.control(iv=1,tol=1e-3)
##D       z    <- TML1.noncensored(y,errors="logWeibull", initial="S",otp="adaptive",
##D               cov="no",control=ctrl)
## End(Not run)




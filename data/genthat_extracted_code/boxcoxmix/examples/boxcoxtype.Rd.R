library(boxcoxmix)


### Name: boxcoxtype
### Title: Box-Cox-type link function for logistic mixed-effects Models
### Aliases: boxcoxtype boxcoxpower binomial
### Keywords: boxcoxtype

### ** Examples

#Beta blockers data
data("betablocker", package = "flexmix")
library(npmlreg)
betavc <-allvc(cbind(Deaths, Total - Deaths) ~ Treatment, data = betablocker,random=~1|Center,
 k=3,random.distribution='np',family = binomial(link = boxcoxpower(0)))
betavc$disparity
#[1] 318.7211
betavc3 <-boxcoxtype(cbind(Deaths, Total - Deaths) ~ Treatment,random=~1|Center, 
data = betablocker, find.in.range = c(-2,0.4),s=40,k=3,random.distribution='np')
#Maximum Profile Log-likelihood: -158.6025 at lambda= -0.56
betavc3$fit$disparity
#[1] 317.2049
betavc3$aic
#[1] 331.2049
betavc3$bic
#[1] 343.6942





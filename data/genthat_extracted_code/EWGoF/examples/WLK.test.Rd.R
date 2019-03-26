library(EWGoF)


### Name: WLK.test
### Title: GoF tests based on the likelihood for the Weibull distribution
### Aliases: WLK.test
### Keywords: Likelihood based tests Score statistic Wald statistic
###   Likelihood ratio statistic

### ** Examples


x <- rlnorm(50,.3)

#Apply some likelihood based tests
WLK.test(x,type="GG1",funEstimate="MLE",procedure="W")
WLK.test(x,type="PGW",funEstimate="ME",procedure="S")
WLK.test(x,type="MO",funEstimate="LSE",procedure="LR")

#Apply G to censored sample at right r=10
a<- sort(x[1:40])
## Not run: 
##D WLK.test(a,type="G",r=10)
## End(Not run)




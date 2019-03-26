library(jocre)


### Name: cset
### Title: Confidence regions and intervals around multivariate normal
###   means
### Aliases: cset
### Keywords: multivariate

### ** Examples

## Not run: 
##D # Example 1: simultaneous 90% confidence intervals for trivariate data
##D 
##D trivar <- mvtnorm::rmvnorm(n=20, mean=rep(0.05, 3), sigma=toeplitz(c(0.05, 0.04, 0.03)))
##D colnames(trivar) <- c("AUCinf", "AUCt", "Cmax")
##D 
##D tost <- cset(dat=trivar, method="tost", alpha=0.1)
##D summary(tost)
##D 
##D # Example 2: simultaneous 90% confidence regions for bivariate data
##D 
##D bivar <- mvtnorm::rmvnorm(n=20, mean=rep(0.05, 2), sigma=toeplitz(c(0.05, 0.04)))
##D colnames(bivar) <- c("AUC", "Cmax")
##D 
##D hotelling <- cset(dat=bivar, method="hotelling", alpha=0.1)
##D summary(hotelling)
##D plot(hotelling, main="90% Hotelling Region")
##D 
##D limacon <- cset(dat=bivar, method="limacon.asy", alpha=0.1)
##D summary(limacon)
##D plot(limacon, main="90% Limacon Region")
##D 
##D tseng <- cset(dat=bivar, method="tseng", alpha=0.1)
##D summary(tseng)
##D plot(tseng, main="90% Tseng Region")
## End(Not run)




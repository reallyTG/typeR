library(QuantPsyc)


### Name: distInd.ef
### Title: Complex Mediation for use in Bootstrapping
### Aliases: distInd.ef
### Keywords: models

### ** Examples


cormat <- matrix (c(1,.3,.15,.075,.3,1,.3,.15,.15,.3,1,.3,.075,.15,.3,1),ncol=4)
require(MASS)
d200 <- data.frame(mvrnorm(200, mu=c(0,0,0,0), cormat))
names(d200) <- c("x","m1","m2","y")

require(boot)
distmed.boot <- boot(d200, distInd.ef, R=999)
sort(distmed.boot$t)[c(25,975)]	#95% CI
plot(density(distmed.boot$t))	# Distribution of bootstapped indirect effect
summary(distmed.boot$t)





library(STB)


### Name: stb.default
### Title: Simultaneous Tolerance Bands (STB).
### Aliases: stb.default

### ** Examples

### log-normal vector to be checked for normality
## Not run: 
##D set.seed(111)
##D stb(exp(rnorm(30)), col.out="red", legend=TRUE)
##D 
##D ### uniformly distributed sample checked for Chi-Squared Distribution with DF=1, degrees of freedom
##D set.seed(707)
##D stb(runif(25, -5, 5), rand.func=function(n){rchisq(n=n, df=1)}, 
##D     col.out="red", legend=TRUE, main="Chi-Squared with DF=1")
##D 
##D ### check whether an Chi-Squared (DF=1) random sample better fits 
##D stb(rchisq(25, df=1), rand.func=function(n){rchisq(n=n, df=1)}, 
##D     col.out="red", legend=TRUE, main="Chi-Squared with DF=1")
##D 
##D ### add STB to an existing plot
##D plot(sort(rnorm(30)), sort(rnorm(30)))
##D stb(rnorm(30), add=TRUE)
##D 
##D ### compute STB for later use and prevent plotting
##D STB <- stb(rnorm(30), plot=FALSE)
## End(Not run)




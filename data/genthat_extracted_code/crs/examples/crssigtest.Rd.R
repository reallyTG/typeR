library(crs)


### Name: crssigtest
### Title: Regression Spline Significance Test with Mixed Data Types
### Aliases: crssigtest
### Keywords: nonparametric

### ** Examples

## Not run: 
##D options(crs.messages=FALSE)
##D set.seed(42)
##D 
##D n <- 1000
##D z <- rbinom(n,1,.5)
##D x1 <- rnorm(n)
##D x2 <- runif(n,-2,2)
##D z <- factor(z)
##D ## z is irrelevant
##D y <- x1 + x2 + rnorm(n)
##D 
##D model <- crs(y~x1+x2+z,complexity="degree",segments=c(1,1))
##D summary(model)
##D 
##D model.sigtest <- crssigtest(model)
##D summary(model.sigtest)
## End(Not run)




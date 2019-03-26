library(mosaic)


### Name: cdist
### Title: Central portion of a distribution
### Aliases: cdist xcgamma xct xcchisq xcf xcbinom xcpois xcgeom xcnbinom
###   xcbeta

### ** Examples

cdist( "norm", .95)
cdist( "t", c(.90, .95, .99), df=5)
cdist( "t", c(.90, .95, .99), df=50)
cdist( "t", .95, df=c(3,5,10,20))
cdist( "t", .95, df=c(3,5,10,20), verbose = TRUE )
cdist( "norm", .95, mean=500, sd=100 )
cdist( "chisq", c(.90, .95), df=3 )
# CI
x <- rnorm(23, mean = 10, sd = 2)
cdist("t", p = 0.95, df=22)
mean(x) + cdist("t", p = 0.95, df=22) * sd(x) / sqrt(23)
confint(t.test(x))
cdist("t", p = 0.95, df=22, verbose = TRUE)




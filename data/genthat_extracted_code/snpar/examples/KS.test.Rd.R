library(snpar)


### Name: KS.test
### Title: Kolmogorov-Smirnov Test
### Aliases: KS.test
### Keywords: KStest

### ** Examples

# one-sample Kolmogorov-Smirnov test
x <- rnorm(100,2,3)
KS.test(x, "pnorm", 2, 3)

# two-sample Kolmogorov-Smirnov test
y <- rgamma(100,1,6)
KS.test(x,y)




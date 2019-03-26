library(NORMT3)


### Name: dnormt3
### Title: Density function of sum of Gaussian and Student's t on 3 df
### Aliases: dnormt3
### Keywords: distribution

### ** Examples

dnormt3(0)
#
# Should be 0.4501582 = sqrt(2)/pi
#
x <- seq(from=-5, to=5, length=100)
plot(x, dnormt3(x), type="l")	# Density plot




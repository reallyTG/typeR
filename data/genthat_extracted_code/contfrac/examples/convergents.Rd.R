library(contfrac)


### Name: convergents
### Title: Partial convergents of continued fractions
### Aliases: convergents gconvergents c_contfrac c_contfrac_complex
###   c_convergents c_convergents_complex
### Keywords: math

### ** Examples

# Successive approximations to pi:

jj <- convergents(c(3,7,15,1,292))
jj$A/jj$B - pi     # should get smaller


convergents(rep(1,10))






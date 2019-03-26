library(emon)


### Name: size2.samevar
### Title: Calculates negative binomial size to preserve constant variance.
### Aliases: size2.samevar

### ** Examples

mu1=5; mu2=10; s1=3
s2 = size2.samevar(mu1, mu2, s1)
s2
# Check variances are the same
v1 = mu1 + mu1^2 / s1
v2 = mu2 + mu2^2 / s2
v1; v2




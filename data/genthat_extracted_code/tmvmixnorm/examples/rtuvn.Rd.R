library(tmvmixnorm)


### Name: rtuvn
### Title: Random number generation for truncated univariate normal
###   distribution
### Aliases: rtuvn

### ** Examples

set.seed(1203)
ans <- rtuvn(n=1000, mean=1, sd=2, lower=-2, upper=3)
summary(ans)

# Check if the sample matches with CDF by KS test
ks.test(ans,"ptuvn",1,2,-2,3)





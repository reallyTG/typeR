library(asypow)


### Name: info.binomial.design
### Title: Expected Information Matrix for a Binomial Design
### Aliases: info.binomial.design
### Keywords: htest

### ** Examples

# Find the information matrix for a 2 group
# logistic binomial Design with a quadratic
# combination of covariate x and different
# sample sizes at each point
abc <- rbind(c(1.2, .9, .3),c(0.33, .21, .05))
covar <- c(1, 2, 3,  4,5)
sample.size <- rbind(c(10,11,12,10,9), c(8,7,10,8,9))
info.binom <- info.binomial.design(model="quadratic", link="logistic", 
                                theta = abc, xpoints = covar,
                                natx=sample.size)
print(info.binom)




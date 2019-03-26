library(asypow)


### Name: info.poisson.design
### Title: Expected Information Matrix for a Poisson Design
### Aliases: info.poisson.design
### Keywords: htest

### ** Examples

# Find the information matrix for a 2 group
# logistic Poisson design with a quadratic
# combination of covariate x and different
# sample sizes at each point
abc <- rbind(c(1.2,.9,.3), c(0.33,.21,.05))
covar <- c(1, 2, 3, 4, 5)
sample.size <- rbind(c(10,11,12,10,9), c(8,7,10,8,9))
info.poiss <- info.poisson.design(model="quadratic",
                                theta = abc, xpoints = covar,
                                natx=sample.size)
print(info.poiss)




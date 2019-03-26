library(robustbase)


### Name: pulpfiber
### Title: Pulp Fiber and Paper Data
### Aliases: pulpfiber
### Keywords: datasets

### ** Examples

data(pulpfiber)
str(pulpfiber)

pairs(pulpfiber, gap=.1)
## 2 blocks of 4 ..
c1 <- cov(pulpfiber)
cR <- covMcd(pulpfiber)
## how different are they: The robust estimate has more clear high correlations:
symnum(cov2cor(c1))
symnum(cov2cor(cR$cov))




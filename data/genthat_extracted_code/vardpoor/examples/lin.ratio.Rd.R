library(vardpoor)


### Name: lin.ratio
### Title: Linearization of the ratio estimator
### Aliases: lin.ratio
### Keywords: survey

### ** Examples

Y <- data.table(Y = rchisq(10, 3))
Z <- data.table(Z = rchisq(10, 3))
weights <- rep(2, 10)
data.table(Y, Z, weights, 
           V1 = lin.ratio(Y, Z, weights, percentratio = 1),
           V10 = lin.ratio(Y, Z, weights, percentratio = 10),
           V100 = lin.ratio(Y, Z, weights, percentratio = 100))




library(semTools)


### Name: efa.ekc
### Title: Empirical Kaiser criterion
### Aliases: efa.ekc

### ** Examples


## Simulate data with 3 factors
model <- '
  f1 =~ .3*x1 + .5*x2 + .4*x3
  f2 =~ .3*x4 + .5*x5 + .4*x6
  f3 =~ .3*x7 + .5*x8 + .4*x9
'
dat <- simulateData(model, seed = 123)
## save summary statistics
myCovMat <- cov(dat)
myCorMat <- cor(dat)
N <- nrow(dat)

## Run the EKC function
(out <- efa.ekc(dat))

## To extract the recommended number of factors using the EKC:
attr(out, "nfactors")

## If you do not have raw data, you can use summary statistics
(x1 <- efa.ekc(sample.cov = myCovMat, sample.nobs = N, plot = FALSE))
(x2 <- efa.ekc(sample.cov = myCorMat, sample.nobs = N, plot = FALSE))





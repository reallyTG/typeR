library(FENmlm)


### Name: nobs.femlm
### Title: Extract the number of observations form a femlm object
### Aliases: nobs.femlm

### ** Examples


# simple estimation on iris data, clustering by "Species"
res = femlm(Sepal.Length ~ Sepal.Width + Petal.Length +
            Petal.Width | Species, iris)

nobs(res)
logLik(res)






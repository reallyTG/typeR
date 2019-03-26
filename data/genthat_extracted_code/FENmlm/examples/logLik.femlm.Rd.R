library(FENmlm)


### Name: logLik.femlm
### Title: Extracts the log-likelihood
### Aliases: logLik.femlm

### ** Examples


# simple estimation on iris data, clustering by "Species"
res = femlm(Sepal.Length ~ Sepal.Width + Petal.Length +
            Petal.Width | Species, iris)

nobs(res)
logLik(res)






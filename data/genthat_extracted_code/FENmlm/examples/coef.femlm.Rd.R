library(FENmlm)


### Name: coef.femlm
### Title: Extracts the coefficients from a femlm fit
### Aliases: coef.femlm coefficients.femlm

### ** Examples


# simple estimation on iris data, clustering by "Species"
res = femlm(Sepal.Length ~ Sepal.Width + Petal.Length +
            Petal.Width | Species, iris)

# the coefficients of the variables:
coef(res)

# the cluster coefficients:
getFE(res)






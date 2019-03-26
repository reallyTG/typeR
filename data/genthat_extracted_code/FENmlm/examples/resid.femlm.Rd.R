library(FENmlm)


### Name: resid.femlm
### Title: Extracts residuals from a femlm object
### Aliases: resid.femlm residuals.femlm

### ** Examples


# simple estimation on iris data, clustering by "Species"
res_poisson = femlm(Sepal.Length ~ Sepal.Width + Petal.Length +
                    Petal.Width | Species, iris)

# we plot the residuals
plot(resid(res_poisson))





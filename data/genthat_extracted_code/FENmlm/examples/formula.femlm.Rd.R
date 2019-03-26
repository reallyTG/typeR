library(FENmlm)


### Name: formula.femlm
### Title: Extract the formula of a femlm fit
### Aliases: formula.femlm

### ** Examples


# simple estimation on iris data, clustering by "Species"
res = femlm(Sepal.Length ~ Sepal.Width + Petal.Length +
            Petal.Width | Species, iris)

# formula with the cluster variable
formula(res)
# linear part without the cluster variable
formula(res, "linear")






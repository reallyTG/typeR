library(FENmlm)


### Name: model.matrix.femlm
### Title: Design matrix of a femlm model
### Aliases: model.matrix.femlm

### ** Examples


# simple estimation on iris data, clustering by "Species"
res = femlm(Sepal.Length ~ Sepal.Width*Petal.Length +
            Petal.Width | Species, iris)

head(model.matrix(res))







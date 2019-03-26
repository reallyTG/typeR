library(ManlyMix)


### Name: Manly.model
### Title: Manly mixture model
### Aliases: Manly.model
### Keywords: Manly mixture

### ** Examples


set.seed(123)

K <- 3; p <- 4
X <- as.matrix(iris[,-5])
id.true <- rep(1:K, each = 50)

Obj <- Manly.model(X, K = 1:5, initial = "emEM", nstart = 1, short.iter = 5)





library(mvdalab)


### Name: pca.nipals
### Title: PCA with the NIPALS algorithm
### Aliases: pca.nipals print.npca

### ** Examples

my.nipals <- pca.nipals(iris[, 1:4], ncomps = 4, tol = 1e-08)
names(my.nipals)

#Check results
my.nipals$Loadings
svd(scale(iris[, 1:4], scale = FALSE))$v

nipals.scores <- data.frame(my.nipals$Scores)
names(nipals.scores) <- paste("np", 1:4)
svd.scores <- data.frame(svd(scale(iris[, 1:4], scale = FALSE))$u)
names(svd.scores) <- paste("svd", 1:4)
Scores. <- cbind(nipals.scores, svd.scores)
plot(Scores.)

my.nipals$Loading.Space
my.nipals$Score.Space




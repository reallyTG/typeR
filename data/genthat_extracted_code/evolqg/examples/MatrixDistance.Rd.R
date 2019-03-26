library(evolqg)


### Name: MatrixDistance
### Title: Matrix distance
### Aliases: MatrixDistance MatrixDistance.default MatrixDistance.list
### Keywords: matrixDistance matrixcomparison

### ** Examples

c1 <- RandomMatrix(10)
c2 <- RandomMatrix(10)
c3 <- RandomMatrix(10)
MatrixDistance(c1, c2, "OverlapDist")
MatrixDistance(c1, c2, "RiemannDist")

MatrixDistance(list(c1, c2, c3), distance = "OverlapDist")


c4 <- RandomMatrix(10)
MatrixDistance(list(c1, c2, c3), c4)




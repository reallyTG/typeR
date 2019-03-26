library(qlcMatrix)


### Name: dimRed
### Title: Dimensionality Reduction for sparse matrices, based on Cholesky
###   decomposition
### Aliases: dimRed

### ** Examples

# some random points in two dimensions
coor <- cbind(sample(1:30), sample(1:30))

# using cmdscale() to reconstruct the coordinates from a distance matrix
d <- dist(coor)
mds <- cmdscale(d)

# using dimRed() on a similarity matrix.
# Note that normL works much better than other norms in this 2-dimensional case
s <- cosSparse(t(coor), norm = normL)
red <- as.matrix(dimRed(s)$L)

# show the different point clouds

par(mfrow = c(1,3))

  plot(coor, type = "n", axes = FALSE, xlab = "", ylab = "")
  text(coor, labels = 1:30)
  title("Original coordinates")
  
  plot(mds, type = "n", axes = FALSE, xlab = "", ylab = "")
  text(mds, labels = 1:30)
  title("MDS from euclidean distances")
  
  plot(red, type = "n", axes = FALSE, xlab = "", ylab = "")
  text(red, labels = 1:30)
  title("dimRed from cosSparse similarity")

par(mfrow = c(1,1))

# ======

# example, using the iris data
data(iris)
X <- t(as.matrix(iris[,1:4]))
cols <- rainbow(3)[iris$Species]

s <- cosSparse(X, norm = norm1)
d <- dist(t(X), method = "manhattan")

svd <- as.matrix(dimRed(s, method = "svd")$L)
chol <- as.matrix(dimRed(s, method = "cholesky")$L)
mds <- cmdscale(d)

par(mfrow = c(1,3))
  plot(mds, col = cols, main = "cmdscale\nfrom euclidean distances")
  plot(svd, col = cols, main = "dimRed with svd\nfrom cosSparse with norm1")
  plot(chol, col = cols, main = "dimRed with cholesky\nfrom cosSparse with norm1")
par(mfrow = c(1,1))




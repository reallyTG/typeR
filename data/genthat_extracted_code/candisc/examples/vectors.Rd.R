library(candisc)


### Name: vectors
### Title: Draw Labeled Vectors in 2D or 3D
### Aliases: vectors vectors3d
### Keywords: aplot

### ** Examples

plot(c(-3, 3), c(-3,3), type="n")
X <- matrix(rnorm(10), ncol=2)
rownames(X) <- LETTERS[1:5]
vectors(X, scale=2, col=palette())





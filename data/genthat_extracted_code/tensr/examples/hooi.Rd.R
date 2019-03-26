library(tensr)


### Name: hooi
### Title: Calculate the higher-order orthogonal iteration (HOOI).
### Aliases: hooi
### Keywords: decompositions

### ** Examples

## Generate random data.
p <- c(2, 3, 4)
X <- array(stats::rnorm(prod(p)), dim = p)

## Calculate HOOI
r <- c(2, 2, 2)
hooi_x <- hooi(X, r = r)
G <- hooi_x$G
U <- hooi_x$U

## Reconstruct the hooi approximation.
X_approx <- atrans(G, U)
fnorm(X - X_approx)




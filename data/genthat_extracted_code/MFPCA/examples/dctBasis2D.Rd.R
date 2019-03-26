library(MFPCA)


### Name: dctBasis2D
### Title: Calculate a cosine basis representation for functional data on
###   two- or three-dimensional domains
### Aliases: dctBasis2D dctBasis3D
### Keywords: internal

### ** Examples

# Simulate data with 10 observations on two-dimensional domain (images)
x1 <- seq(0, 1, length.out = 50)
x2 <- seq(-1, 1, length.out = 75)
f2 <- funData(argvals = list(x1, x2),
              X = aperm(replicate(10, x1 %o% cos(pi*x2) +
                                  matrix(rnorm(50*75, sd = 0.1), nrow = 50)),
                       c(3,1,2)))

# Calculate basis functions: This will throw an error if fftw3 is not installed.
## Not run: 
##D dct2D <- MFPCA:::dctBasis2D(f2, qThresh = 0.95)
##D 
##D # verify that scores are saved in a sparse matrix
##D dct2D$scores[,1:25] # the first 25 scores for each observation
## End(Not run)




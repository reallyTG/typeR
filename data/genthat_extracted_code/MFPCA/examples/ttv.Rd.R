library(MFPCA)


### Name: ttv
### Title: Tensor times vector calculation
### Aliases: ttv

### ** Examples

# create a three-mode tensor
a1 <- seq(0,1, length.out = 10)
a2 <- seq(-1,1, length.out = 20)
a3 <- seq(-pi, pi, length.out = 15)
A <-a1 %o% a2 %o% a3
dim(A)

# multiply along different dimensions
dim(ttv(A = A, v = list(rnorm(10)), dim = 1))
dim(ttv(A = A, v = list(rnorm(20)), dim = 2))
dim(ttv(A = A, v = list(rnorm(15)), dim = 3))

# multiply along more than one dimension
length(ttv(A = A, v = list(rnorm(10), rnorm(15)), dim = c(1,3)))




library(mipfp)


### Name: GetLinInd
### Title: Extracting the linearly independant columns from a matrix
### Aliases: GetLinInd
### Keywords: array algebra

### ** Examples

# generation of a matrix with linearly dependant columns
A <- matrix(c(1, 2, 3,
              1, 2, 4,
              1, 2, 8), nrow = 3, ncol = 3, byrow = TRUE)
              
# extracting and printing the linearly independant columns
B <- GetLinInd(A)
print(B)




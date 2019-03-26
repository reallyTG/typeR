library(Smisc)


### Name: findDepMat
### Title: Identify linearly dependent rows or columns in a matrix
### Aliases: findDepMat
### Keywords: misc

### ** Examples

# A matrix
Y <- matrix(c(1, 3, 4,
              2, 6, 8,
              7, 2, 9,
              4, 1, 7,
              3.5, 1, 4.5), byrow = TRUE, ncol = 3)

# Note how row 2 is multiple of row 1, row 5 is a multiple of row 3
print(Y)

findDepMat(Y)
findDepMat(t(Y), rows = FALSE)




library(strider)


### Name: convolve2
### Title: Convolve Matrices
### Aliases: convolve2

### ** Examples

a = matrix(c(1, 2, 1,
             1, 1, 1), 2, 3, byrow = TRUE)
b = matrix(c(0, 0, 0,
             0, 0, 0,
             0, 1, 0,
             0, 0, 0), 4, 3, byrow = TRUE)
convolve2(a, b)





library(gapfill)


### Name: Array2Matrix
### Title: Convert an Array with 4 Dimensions into a Matrix
### Aliases: Array2Matrix

### ** Examples

a <- array(data = 1:16, dim = c(2, 2, 2, 2))
Array2Matrix(a = a)
attr(a, "mp") <- c(1, 2, 2, 1)
Array2Matrix(a = a)

Array2Matrix(ArrayAround(data = a, mp = c(1, 1, 1, 1),
                         size = c(1, 1, 2, 2))) 




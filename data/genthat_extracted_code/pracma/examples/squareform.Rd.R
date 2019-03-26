library(pracma)


### Name: squareform
### Title: Format Distance Matrix (Matlab Style)
### Aliases: squareform
### Keywords: array

### ** Examples

x <- 1:6
y <- squareform(x)
#  0  1  2  3
#  1  0  4  5
#  2  4  0  6
#  3  5  6  0
all(squareform(y) == x)
# TRUE




library(riskRegression)


### Name: colMultiply_cpp
### Title: Apply * by column
### Aliases: colMultiply_cpp

### ** Examples

x <- matrix(1,6,5)
sweep(x, MARGIN = 1, FUN = "*", STATS = 1:6)
colMultiply_cpp(x, 1:6 )




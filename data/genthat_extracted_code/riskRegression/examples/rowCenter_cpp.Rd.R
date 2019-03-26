library(riskRegression)


### Name: rowCenter_cpp
### Title: Apply - by row
### Aliases: rowCenter_cpp

### ** Examples

x <- matrix(1,6,5)
sweep(x, MARGIN = 2, FUN = "-", STATS = 1:5)
rowCenter_cpp(x, 1:5 )

rowCenter_cpp(x, colMeans(x) )




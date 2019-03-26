library(riskRegression)


### Name: rowScale_cpp
### Title: Apply / by row
### Aliases: rowScale_cpp

### ** Examples

x <- matrix(1,6,5)
sweep(x, MARGIN = 2, FUN = "/", STATS = 1:5)
rowScale_cpp(x, 1:5 )

rowScale_cpp(x, colMeans(x) )




library(riskRegression)


### Name: colScale_cpp
### Title: Apply / by column
### Aliases: colScale_cpp

### ** Examples

x <- matrix(1,6,5)
sweep(x, MARGIN = 1, FUN = "/", STATS = 1:6)
colScale_cpp(x, 1:6 )




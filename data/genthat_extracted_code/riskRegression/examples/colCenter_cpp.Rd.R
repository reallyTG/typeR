library(riskRegression)


### Name: colCenter_cpp
### Title: Apply - by column
### Aliases: colCenter_cpp

### ** Examples

x <- matrix(1,6,5)
sweep(x, MARGIN = 1, FUN = "-", STATS = 1:6)
colCenter_cpp(x, 1:6 )




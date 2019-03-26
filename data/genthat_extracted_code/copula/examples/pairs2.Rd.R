library(copula)


### Name: pairs2
### Title: Scatter-Plot Matrix ('pairs') for Copula Distributions with Nice
###   Defaults
### Aliases: pairs2
### Keywords: hplot

### ** Examples

## Create a 100 x 7 matrix of random variates from a t distribution
## with four degrees of freedom and plot the generated data
U <- matrix(rt(700, df = 4), ncol = 7)
pairs2(U, pch = ".")




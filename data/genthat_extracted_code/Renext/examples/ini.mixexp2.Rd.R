library(Renext)


### Name: ini.mixexp2
### Title: Simple estimation for the mixture of two exponential
###   distributions
### Aliases: ini.mixexp2

### ** Examples

set.seed(1234)
x <- rmixexp2(n = 100, prob1 = 0.5, rate2 = 4)
res <- ini.mixexp2(x, plot = TRUE)





library(moveHMM)


### Name: pseudoRes
### Title: Pseudo-residuals
### Aliases: pseudoRes

### ** Examples

# m is a moveHMM object (as returned by fitHMM), automatically loaded with the package
m <- example$m
res <- pseudoRes(m)
qqnorm(res$stepRes)
qqnorm(res$angleRes)





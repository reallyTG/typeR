library(mixlm)


### Name: plotprops
### Title: Property plots for relevant component analysis
### Aliases: plotprops
### Keywords: Regression Classification

### ** Examples

X <- matrix(rnorm(100),20,5)
Y <- matrix(rnorm(20),20,1)
plotprops(Y, X, doscaleX = FALSE, docenterX = TRUE, 5)




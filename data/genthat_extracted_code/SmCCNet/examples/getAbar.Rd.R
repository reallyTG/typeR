library(SmCCNet)


### Name: getAbar
### Title: Compute the similarity matrix based on one or more canonical
###   correlation weight vectors.
### Aliases: getAbar

### ** Examples

w <- matrix(rnorm(6), nrow = 3)
Ws <- apply(w, 2, function(x)return(x/sqrt(sum(x^2))))
abar <- getAbar(Ws, P1 = 2, FeatureLabel = NULL)





library(irr)


### Name: rater.bias
### Title: Coefficient of rater bias
### Aliases: rater.bias
### Keywords: misc

### ** Examples

 # fake a 2xn matrix of three way classification scores
 ratings <- matrix(sample(1:3,60,TRUE), nrow=2)
 rater.bias(ratings)

 # Example from Bishop, Fienberg & Holland (1978), Table 8.2-1
 data(vision)
 rater.bias(vision)                      




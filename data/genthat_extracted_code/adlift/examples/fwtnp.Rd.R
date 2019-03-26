library(adlift)


### Name: fwtnp
### Title: fwtnp
### Aliases: fwtnp fwtnp2
### Keywords: methods

### ** Examples

#
# Generate some one-dimensional data: 100 observations.
#
input <- runif(100)
f <- input^2 - 3*input
#
# Compute fwtnp function on this data
#
out <- fwtnp(input,f,LocalPred=AdaptPred,neighbours=2,closest=TRUE)
#
# That's it.
#




library(nlt)


### Name: fwtnpperm
### Title: fwtnpperm
### Aliases: fwtnpperm
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
vec<-sample(1:100,98,FALSE)

out <- fwtnpperm(input,f,LocalPred=AdaptPred,neighbours=2,closest=TRUE,mod=vec)
#
# That's it.
#




library(graphon)


### Name: gmodel.preset
### Title: Generate one of pre-specified graphons.
### Aliases: gmodel.preset

### ** Examples

## Not run: 
##D ## Generate 3 random graphons of nodal size 100.
##D n  = 100
##D r3 = (sample(1:10,3))
##D W1 = gmodel.preset(n,id=r3[1])
##D W2 = gmodel.preset(n,id=r3[2])
##D W3 = gmodel.preset(n,id=r3[3])
##D 
##D ## Generate corresponding observations and plot them
##D A1 = gmodel.P(W1)
##D A2 = gmodel.P(W2)
##D A3 = gmodel.P(W3)
##D 
##D \dontshow{
##D  for (i in 1:10){
##D    W = gmodel.preset(100,id=i)
##D  }
##D }
## End(Not run)





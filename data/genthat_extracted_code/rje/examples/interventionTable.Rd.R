library(rje)


### Name: interventionTable
### Title: Calculate interventional distributions.
### Aliases: interventionTable intervention.table interventionMatrix
### Keywords: arith

### ** Examples

set.seed(413)
# matrix of distributions
p = rdirichlet(10, rep(1,16))
interventionMatrix(p, 3, 2)

# take one in an array
ap = array(p[1,], rep(2,4))
interventionTable(ap, 3, 2)




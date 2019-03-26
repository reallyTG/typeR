library(nat)


### Name: all.equal.dotprops
### Title: all.equal method tailored to dotprops objects
### Aliases: all.equal.dotprops

### ** Examples

# equal using default 
kc1=kcs20[[1]]
kc1.recalc=dotprops(kc1)
# not equal due to differences in attributes and vectors
all.equal.default(kc1.recalc, kc1)
# still not equal because of tangent vector flipping
all.equal.default(kc1.recalc, kc1, check.attributes=FALSE)
# equal using appropriate method
stopifnot(isTRUE(all.equal(kc1.recalc, kc1)))
# NB identical when recalculated on same setup from same data
stopifnot(isTRUE(all.equal.default(kc1.recalc, dotprops(kc1))))




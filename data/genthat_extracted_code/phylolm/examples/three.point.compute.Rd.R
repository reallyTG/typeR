library(phylolm)


### Name: three.point.compute
### Title: Computations with a (generalized) three-point structured tree
### Aliases: three.point.compute

### ** Examples

tre1 = rtree(500)
tre2 = transf.branch.lengths(phy=tre1, model="OUrandomRoot",
                             parameters = list(alpha = 0.5))
Q = rTrait(n=2,tre1)
y = rTrait(n=1,tre1)
P = cbind(1,y)
three.point.compute(tre2$tree,P,Q,tre2$diagWeight)




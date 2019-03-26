library(treespace)


### Name: treeDist
### Title: Metric function
### Aliases: treeDist

### ** Examples


## generate random trees
tree.a <- rtree(6)
tree.b <- rtree(6)
treeDist(tree.a,tree.b) # lambda=0
treeDist(tree.a,tree.b,1)  # lambda=1
dist.func <- treeDist(tree.a,tree.b,return.lambda.function=TRUE) # distance as a function of lambda
dist.func(0) # evaluate at lambda=0. Equivalent to treeDist(tree.a,tree.b).
## We can see how the distance changes when moving from focusing on topology to length:
plot(sapply(seq(0,1,length.out=100), function(x) dist.func(x)), type="l",ylab="",xlab="")

## The distance may also change if we emphasise the position of certain tips:
plot(sapply(tree.a$tip.label, function(x) treeDist(tree.a,tree.b,emphasise.tips=x)),
     xlab="Tip number",ylab="Distance when  vector entries corresponding to tip are doubled")






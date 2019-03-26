library(cba)


### Name: order.greedy
### Title: Hierarchical Greedy Ordering
### Aliases: order.greedy
### Keywords: hplot cluster

### ** Examples

d <- dist(matrix(runif(20), ncol=2))
hc <- hclust(d)
co <- order.optimal(d, hc$merge)
md <- -as.dist(crossprod(as.matrix(d, diag = 0)))   # Murtagh's distances
hg <- order.greedy(md)
go <- order.optimal(md, hg$merge)
### compare images
op <- par(mfrow=c(2,2), pty="s")
implot(d[[hc$order]], main="hclust")
implot(d[[co$order]], main="hlcust + optimal")
implot(d[[hg$order]], main="greedy")
implot(d[[go$order]], main="greedy + optimal")
par(op)
# compare lengths
order.length(d, hc$order)
order.length(d, co$order)
order.length(d, hg$order)
order.length(d, go$order)




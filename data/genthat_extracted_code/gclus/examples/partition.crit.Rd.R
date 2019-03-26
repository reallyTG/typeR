library(gclus)


### Name: partition.crit
### Title: Combines the results of appplying an index to each group of
###   observations
### Aliases: partition.crit
### Keywords: multivariate cluster

### ** Examples

x <- runif(20)
y <- runif(20)
g <- rep(c("a","b"),10)

partition.crit(x,y,g)


data(bank)
# m is a homogeneity measure of each pairwise variable plot
m <- -colpairs(scale(bank[,-1]), partition.crit,gfun=gave,groups=bank[,1])

# Color panels by level of m and reorder variables so that
# pairs with high m are near the diagonal. Panels shown
# in pink have the highest amount of group homogeneity, as measured by 
# gave.
cpairs(bank[,-1],order=order.single(m), panel.colors=dmat.color(m),
gap=.3,col=c("purple","black")[bank[,"Status"]+1],
pch=c(5,3)[bank[,"Status"]+1])

# Try  a different measure
m <- -colpairs(scale(bank[,-1]), partition.crit,gfun=diameter,groups=bank[,1])

cpairs(bank[,-1],order=order.single(m), panel.colors=dmat.color(m),
gap=.3,col=c("purple","black")[bank[,"Status"]+1],
pch=c(5,3)[bank[,"Status"]+1])


# Result is the same, in this case.





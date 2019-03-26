library(gclus)


### Name: colpairs
### Title: Applies a function to all pairs of columns
### Aliases: colpairs
### Keywords: multivariate

### ** Examples

data(state)
state.m <- colpairs(state.x77, 
function(x,y)  cor.test(x,y,"two.sided","kendall")$estimate, diag=1)
state.col <- dmat.color(state.m)
# This is equivalent to state.m <- cor(state.x77,method="kendall")


layout(matrix(1:2,nrow=1,ncol=2))
cparcoord(state.x77, panel.color= state.col)
# Get rid of the panels with lots of line crossings (yellow) by reorderings
cparcoord(state.x77, order.endlink(state.m), state.col)
layout(matrix(1,1))


# m is a homogeneity measure of each pairwise variable plot
m <- -colpairs(scale(state.x77), gave)

o<- order.single(m)
pcols = dmat.color(m)
# Color panels by level of m and reorder variables so that
# pairs with high m are near the diagonal.
cpairs(state.x77,order=o, panel.colors=pcols)

# In this case panels showing either of Area or Population
# exhibit the most clumpiness because these variables
# are skewed.





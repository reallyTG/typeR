library(SearchTrees)


### Name: rectLookup
### Title: Perform Rectangular Lookup in 2d Space
### Aliases: rectLookup 'rectLookup, QuadTree-method'
### Keywords: rectangular lookup query

### ** Examples

x = rnorm(100)
y = rnorm(100)
x2 = x + runif(100, .5, 2)
y2 = y + runif(100, .5, 2)
dat2 = cbind(x, y, x2, y2)
tree2 = createTree(dat2, dataType="rect", columns= 1:4)
inrect = rectLookup(tree2, xlim = c(0,1), ylim=c(0, 1))
col = rgb(0, 1, 0, alpha=.5)
plot(x, y2, col="white")
rect(x[inrect], y[inrect], x2[inrect], y2[inrect], col=col)
rect(0, 0, 1, 1, col="blue", lwd=3)




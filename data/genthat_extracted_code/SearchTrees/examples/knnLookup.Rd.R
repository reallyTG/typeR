library(SearchTrees)


### Name: knnLookup
### Title: Perform k-Nearest Neighbors Lookup Using a Search Tree
### Aliases: knnLookup 'knnLookup, QuadTree-method'
### Keywords: knn lookup neighbors

### ** Examples

x = rnorm(100)
y = rnorm(100)
tree = createTree(cbind(x,y))
newx = c(0, .5)
newy = c(.5, 0)
inds = knnLookup(tree, newx, newy, k=7)

ch = rep(1, times=100)
ch[inds[1:7]] = 3
ch[inds[8:14]] = 5
cls = rep("black", times=100)
cls[inds[1:7]] = "red"
cls[inds[8:14]] ="blue"

plot(x,y, pch=ch, col = cls)
abline(v=newx[1], h = newy[1] , col="red")
abline(v=newx[2], h = newy[2], col = "blue")




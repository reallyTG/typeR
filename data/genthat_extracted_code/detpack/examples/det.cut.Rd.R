library(detpack)


### Name: det.cut
### Title: Identify Tree Leafs Intersected by Condition(s)
### Aliases: det.cut

### ** Examples

# DET based on Gaussian data
require(stats); require(graphics)
n <- 8e4; x <- rnorm(n)
x <- matrix(c(x, x+rnorm(n,0,0.2)), ncol = 2)
det <- det.construct(t(x), lb = 0, ub = 0) # no pre-whitening
plot(x, type = "p", pch = ".", asp = 1)
# leaf elements that are cut by x1 = 2
leafs <- det.cut(det, xc = 2, dc = 1) # condition x1 = 2
# draw probability space (black) with cut leaf elements (red)
rect(det$lb[1], det$lb[2], det$ub[1], det$ub[2], border = "black")
for (k in 1:length(leafs)) {
   p <- det.de(det, leafs[k])$lb; w <- det.de(det, leafs[k])$size
   rect(p[1],p[2],p[1]+w[1],p[2]+w[2], border = "red")
}
# leafs cut by two conditions x1 = -3, x2 = -2 (blue)
leafs <- det.cut(det, xc = c(-2,-3), dc = c(2,1))
p <- det.de(det, leafs[1])$lb; w <- det.de(det, leafs[1])$size
rect(p[1],p[2],p[1]+w[1],p[2]+w[2], border = "blue")




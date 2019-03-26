library(cgam)


### Name: tree
### Title: Specify a Tree-Ordering in a CGAM Formula
### Aliases: tree
### Keywords: shape routine

### ** Examples

  # generate y
  set.seed(123)
  n <- 100 
  x <- rep(0:4, each = 20)
  z <- rep(c("a", "b"), 50)
  y <- x + I(z == "a") + rnorm(n, 1)
  xu <- unique(x)

  # regress y on x under the tree-ordering restriction
  fit.tree <- cgam(y ~ tree(x) + factor(z)) 

  # make a plot
  plot(x, y, cex = .7)
  mua = unique(fit.tree$muhat)[unique(z) == "a"]
  points(xu, unique(fit.tree$muhat)[unique(z) == "a"], pch = '+', col = 4, cex = 3)
  legend(0,7.5, bty = "n", "tree-ordering fit: z = 'a'", col = 4, pch = '+', cex = 1.3)
  mub = unique(fit.tree$muhat)[unique(z) == "b"] 
  points(xu, unique(fit.tree$muhat)[unique(z) == "b"], pch = '+', col = 2, cex = 3)
  legend(0,8.5, bty = "n", "tree-ordering fit: z = 'b'", col = 2, pch = '+', cex = 1.3)




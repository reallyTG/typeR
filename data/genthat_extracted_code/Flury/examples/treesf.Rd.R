library(Flury)


### Name: treesf
### Title: Tree data
### Aliases: treesf
### Keywords: datasets

### ** Examples

data(treesf)
## Not run: 
##D Y <- log(treesf$Volume)
##D X1 <- log(treesf$Diameter / 12)
##D X2 <- log(treesf$Height)
##D trees.lm <- lm(Y ~ X1 + X2)
##D summary(trees.lm)
##D log(pi/12)
##D vcov(trees.lm)
## End(Not run)




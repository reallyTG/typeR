library(hsm)


### Name: hsm.path
### Title: Solves proximal operator of latent group Lasso over a grid of
###   lam values.
### Aliases: hsm.path

### ** Examples

# The following example appears in Figure 7 of Yan & Bien (2015).
# Generate map defining DAG.
map <- matrix(0, ncol=2, nrow=8)
map[1, ] <- c(1,2)
map[2, ] <- c(2,7)
map[3, ] <- c(3,4)
map[4, ] <- c(4,6)
map[5, ] <- c(6,7)
map[6, ] <- c(6,8)
map[7, ] <- c(3,5)
map[8, ] <- c(5,6)
# Assume one parameter per node.
# Let parameter and node share the same index.
var <- as.list(1:8)
set.seed(100)
y <- rnorm(8)
result <- hsm(y=y, lam=0.5, map=map, var=var, get.penalval=TRUE)
result.path <- hsm.path(y=y, map=map, var=var, get.penalval=TRUE)




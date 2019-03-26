library(hsm)


### Name: hsm
### Title: Solves proximal operator of latent group lasso in Hierarchical
###   Sparse Modeling.
### Aliases: hsm

### ** Examples

# The following example appears in Figure 7 of Yan & Bien (2015).
# Generate map defining DAG.
map <- matrix(0, ncol=2, nrow=8)
map[1, ] <- c(1, 2)
map[2, ] <- c(2, 7)
map[3, ] <- c(3, 4)
map[4, ] <- c(4, 6)
map[5, ] <- c(6, 7)
map[6, ] <- c(6, 8)
map[7, ] <- c(3, 5)
map[8, ] <- c(5, 6)
# Assume one parameter per node.
# Let parameter and node share the same index.
var <- as.list(1:8)
set.seed(100)
y <- rnorm(8)
result <- hsm(y=y, lam=0.5, map=map, var=var, get.penalval=TRUE)

# Another example in which DAG contains two separate nodes
map <- matrix(0, ncol=2, nrow=2)
map[1, ] <- c(1, NA)
map[2, ] <- c(2, NA)
# Assume ten parameters per node.
var <- list(1:10, 11:20)
set.seed(100)
y <- rnorm(20)
lam <- 0.5
result <- hsm(y=y, lam=lam, map=map, var=var, get.penalval=TRUE)
# The solution is equivalent to performing group-wise soft-thresholdings
beta.st <- c(y[1:10] * max(0, 1 - lam * sqrt(10) / norm(y[1:10], "2")),
          y[11:20] * max(0, 1 - lam * sqrt(10) / norm(y[11:20], "2")))
all.equal(result$beta, beta.st)




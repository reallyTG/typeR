library(OptimalDesign)


### Name: od.RCs
### Title: Efficient exact size-constrained design using the RC heuristic
### Aliases: od.RCs

### ** Examples

# We will compute the D-optimal design for the block model with additive 
# effects of blocks and treatments. Suppose that we have 15 blocks of 
# size two and 10 treatments. The problem is equivalent to the problem 
# of D-optimality in the standard model with 45 design points, 15 trials, 
# and the matrix of regressors F.block computed as below 
# (see the reference for details).

k <- 0
T1 <- T2 <- rep(0,45)
F.aux <- matrix(0, nrow=45, ncol=10)
for(i in 1:9){
  for(j in (i + 1):10){
    k <- k + 1
    T1[k] <- i
    T2[k] <- j
    F.aux[k, i] <- 1
    F.aux[k, j] <- (-1)
  }
}
F.block <-  F.aux %*% eigen(matrix(1, ncol=10, nrow=10))$vectors[, 2:10]

# Compute the D-optimal exact design of size 15 using the RCs procedure.
res <- od.RCs(F.block, 15, crit = "D", t.max=2.5)
res$Phi.best

# Solve the same problem using the KL procedure to check the obtained 
# criterion value.
od.KL(F.block, 15, crit = "D", t.max=1.5)$Phi.best

# Display the treatments in the 15 blocks of the obtained design.
data.frame(T1=T1[as.logical(res$w.best)], T2=T2[as.logical(res$w.best)])

# Note that the concurrence graph of the design is the Petersen graph.




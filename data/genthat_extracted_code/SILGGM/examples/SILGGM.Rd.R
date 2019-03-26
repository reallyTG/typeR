library(SILGGM)


### Name: SILGGM
### Title: Statistical Inference of Large-Scale Gaussian Graphical Model in
###   Gene Networks
### Aliases: SILGGM

### ** Examples

# Simulate a sparse precision matrix Omega
n <- 50
p <- 100
Omega.tmp <- matrix(0,p,p)
diag(Omega.tmp) <- rep(1,p)
for(k in 1:(p/10)){
    i <- 10*(k-1)+1
    for(j in (10*(k-1)+2):(10*(k-1)+10)){
      Omega.tmp[i,j] <- 0.5
      Omega.tmp[j,i] <- 0.5
    }
}
eigenvalue <- eigen(Omega.tmp)$values
Omega <- Omega.tmp+(abs(min(eigenvalue))+0.05)*diag(p)
cov <- solve(Omega)

# Sample an n by p data matrix X based on it
library(MASS)
X <- mvrnorm(n, rep(0, p), cov)

# Run SILGGM
library(SILGGM)

# Use default method D-S_NW_SL without global inference
outlist1 <- SILGGM(X)

# Use method D-S_GL with global inference
# True graph is available
outlist2 <- SILGGM(X, method = "D-S_GL", global = TRUE, true_graph = Omega)

# Use method B_NW_SL without global inference
outlist3 <- SILGGM(X, method = "B_NW_SL")

# Use method GFC_SL or GFC_L
# True graph is available
outlist4 <- SILGGM(X, method = "GFC_SL", true_graph = Omega)
outlist5 <- SILGGM(X, method = "GFC_L", true_graph = Omega)

# Use method D-S_NW_SL with global inference
# True graph is available
# Show the outputs in a Cytoscape format
outlist6 <- SILGGM(X, method = "D-S_NW_SL", global = TRUE,
true_graph = Omega, cytoscape_format = TRUE)

# Show the above outputs in a Cytoscape format table
# Save the table as a .csv file to a temporary directory
outlist7 <- SILGGM(X, method = "D-S_NW_SL", global = TRUE,
true_graph = Omega, cytoscape_format = TRUE, csv_save = TRUE)




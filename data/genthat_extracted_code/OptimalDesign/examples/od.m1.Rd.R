library(OptimalDesign)


### Name: od.m1
### Title: Optimal design for models with a one-dimensional parameter
### Aliases: od.m1

### ** Examples

if(require("gurobi")){
# We will demonstrate the procedure on a simple randomly generated 
# knapsack problem. Here, the squares of elements of F correspond 
# to the values of n available items, the elements of the 1 times n 
# matrix A correspond to the weights of the n items, and the real 
# number b is the upper limit on the total weight of the items that 
# can  be put into the knapsack. 
# The resulting binary "optimal design" determines which of the items 
# should we put into the knapsack to steal the highest possible value.

n <- 200 # There are this many items to choose from.
F.square <- matrix(sample(1:10, n, replace=TRUE), ncol=1) 
# Generate random prices of items.
A <- matrix(sample(1:10, n, replace=TRUE), nrow=1) 
# Generate random weights of items in kgs.
A <- rbind(A, diag(n))  
# We assume that there is just one copy of each item.
b <- c(n / 4, rep(1,n)) 
# The capacity of the knapsack is n/4 kgs.

# Compute the optimal design, which in this case determines how many 
# (0 or 1) of each of the n items should we put into the knapsack.
od.m1(sqrt(F.square), b, A)

# Note: one can compare the result with a specialized function 
# as follows:
# library(adagio); knapsack(A[1,], F.square[,1], n / 4)

# However, od.m1 is more general than the standard knapsack functions.
# Suppose, for instance, that the uncle asks that we must be sure to 
# take the items number 1, 13 and 66. We will compute the most valuable 
# selection of items that fit into our knapsack and contain the 
# required items.
w0 <- rep(0, n); w0[c(1, 13, 66)] <- 1
od.m1(sqrt(F.square), b, A, w0, t.max=2)
}




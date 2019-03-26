library(simcausal)


### Name: rconst
### Title: Constant (Degenerate) Distribution (Returns its Own Argument
###   'const')
### Aliases: rconst

### ** Examples


#---------------------------------------------------------------------------------------
# Specifying and simulating from a DAG with 1 Bernoulli and 2 constant nodes
#---------------------------------------------------------------------------------------
D <- DAG.empty()
D <- D + node("W1", distr = "rbern", prob = 0.45)
D <- D + node("W2", distr = "rconst", const = 1)
D <- D + node("W3", distr = "rconst", const = ifelse(W1 == 1, 5, 10))

# TWO equivalent ways of creating a multivariate node (just repeating W1 and W2):
create_mat <- function(W1, W2) cbind(W1, W2)
vecfun.add("create_mat")

D <- D + node(c("W1.copy1", "W2.copy1"), distr = "rconst", const = c(W1, W2))
D <- D + node(c("W1.copy2", "W2.copy2"), distr = "rconst", const = create_mat(W1, W2))
Dset <- set.DAG(D)
sim(Dset, n=10, rndseed=1)




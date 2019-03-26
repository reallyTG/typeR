library(abn)


### Name: link.strength
### Title: A function that returns the strengths of the edge connections in
###   a Bayesian Network learned form observational data.
### Aliases: link.strength
### Keywords: link strength, connection strength

### ** Examples


dist <- list(a="gaussian",b="gaussian",c="gaussian")
data.param <- matrix(data = c(0,1,0,
                              0,0,1,
                              0,0,0),nrow = 3L,ncol = 3L,byrow = TRUE)
    
data.param.var <- matrix(data = 0,nrow = 3L,ncol = 3L)
diag(data.param.var) <- c(0.1,0.1,0.1)
    
out <- simulateabn(data.dists = dist,
    n.chains = 1,
    n.adapt = 1000,
    n.thin = 1,
    n.iter = 100,
    data.param = data.param,
    data.param.var = data.param.var,
    simulate = TRUE,
    seed = 132)

link.strength(dag.m = data.param,
data.df = out,
data.dists = dist,
method = "ls",
discretization.method = "sturges")





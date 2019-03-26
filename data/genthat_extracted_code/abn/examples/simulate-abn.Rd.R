library(abn)


### Name: simulateabn
### Title: Simulate from an ABN network
### Aliases: simulateabn
### Keywords: simulated data

### ** Examples


#define set of distribution
dist<-list(a="gaussian",
b="gaussian",
c="gaussian",
d="gaussian", 
e="binomial", 
f="binomial")

#define parameter matrix
data.param <- matrix(data = c(1,2,0.5,0,20,0,
                              0,1,3,10,0, 0.8,
                              0,0,1,0,0,0,
                              0,0,0,1,0,0,
                              0,0,0,0,0.5,1,
                              0,0,0,0,0,0),nrow = 6L,ncol = 6L,byrow = TRUE)

#precision matrix 
data.param.var <- matrix(data = 0,nrow = 6L,ncol = 6L)
diag(data.param.var) <- c(10,20,30,40,0,0)

#plot the dag
plotabn(dag.m = ~a|b:c:e+b|c:d:f+e|f,data.dists = dist ,plot = FALSE)

#simulate the data
simulateabn(data.dists = dist,
n.chains = 1,
n.thin = 1,
n.iter = 1000,
data.param = data.param,
data.param.var = data.param.var,
seed = 132)




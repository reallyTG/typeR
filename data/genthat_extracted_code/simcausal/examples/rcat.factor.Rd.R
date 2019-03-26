library(simcausal)


### Name: rcat.factor
### Title: Random Sample for a Categorical Factor
### Aliases: rcat.factor rcategor

### ** Examples


#---------------------------------------------------------------------------------------
# Specifying and simulating from a DAG with one categorical node with constant
# probabilities
#---------------------------------------------------------------------------------------
D <- DAG.empty()
D <- D + node("race",t=0,distr="rcat.factor",probs=c(0.2,0.1,0.4,0.15,0.05,0.1))
Dset <- set.DAG(D)
simdat <- sim(Dset, n=200, rndseed=1)

#---------------------------------------------------------------------------------------
# Specifying and simulating from a DAG with a categorical node with varying
# probabilities (probabilities are determined by values sampled for nodes L0 and L1)
#---------------------------------------------------------------------------------------
D <- DAG.empty()
D <- D + node("L0", distr="rnorm", mean=10, sd=5)
D <- D + node("L1", distr="rnorm", mean=10, sd=5)
D <- D + node("L2", distr="rcat.factor", probs=c(abs(1/L0), abs(1/L1)))
Dset <- set.DAG(D)
simdat <- sim(Dset, n=200, rndseed=1)




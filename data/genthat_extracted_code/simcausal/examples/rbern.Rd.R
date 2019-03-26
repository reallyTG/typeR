library(simcausal)


### Name: rbern
### Title: Random Sample from Bernoulli Distribution
### Aliases: rbern

### ** Examples


#---------------------------------------------------------------------------------------
# Specifying and simulating from a DAG with 3 Bernoulli nodes
#---------------------------------------------------------------------------------------
D <- DAG.empty()
D <- D + node("W1", distr="rbern", prob=0.05)
D <- D + node("W2", distr="rbern", prob=ifelse(W1==1,0.5,0.1))
D <- D + node("W3", distr="rbern", prob=ifelse(W1==1,0.5,0.1))
Dset <- set.DAG(D)
simdat <- sim(Dset, n=200, rndseed=1)




library(simcausal)


### Name: parents
### Title: Show Node Parents Given DAG Object
### Aliases: parents

### ** Examples


D <- DAG.empty()
D <- D + node(name="W1", distr="rbern", prob=plogis(-0.5))
D <- D + node(name="W2", distr="rbern", prob=plogis(-0.5 + 0.5*W1))
D <- D + node(name="A", distr="rbern", prob=plogis(-0.5 - 0.3*W1 - 0.3*W2))
D <- D + node(name="Y", distr="rbern", prob=plogis(-0.1 + 1.2*A + 0.3*W1 + 0.3*W2), EFU=TRUE)
D <- set.DAG(D)
parents(D, c("W2", "A", "Y"))




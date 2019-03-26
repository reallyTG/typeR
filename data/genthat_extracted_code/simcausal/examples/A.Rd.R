library(simcausal)


### Name: A
### Title: Subsetting/Indexing Actions Defined for 'DAG' Object
### Aliases: A

### ** Examples


D <- DAG.empty()
D <- D + node(name="W1", distr="rbern", prob=plogis(-0.5))
D <- D + node(name="W2", distr="rbern", prob=plogis(-0.5 + 0.5*W1))
D <- D + node(name="A", distr="rbern", prob=plogis(-0.5 + 0.5*W1+ 0.5*W2))
D <- set.DAG(D)
# Define two actions, acting on node "A"
D <- D + action("A0", nodes=node("A", distr="rbern", prob=0))
D <- D + action("A1", nodes=node("A", distr="rbern", prob=1))
# Select both actions
A(D)
# Select action "A1" only
A(D)["A1"]




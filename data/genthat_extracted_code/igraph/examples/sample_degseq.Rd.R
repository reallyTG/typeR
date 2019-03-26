library(igraph)


### Name: sample_degseq
### Title: Generate random graphs with a given degree sequence
### Aliases: sample_degseq degree.sequence.game degseq
### Keywords: graphs

### ** Examples


## The simple generator
g <- sample_degseq(rep(2,100))
degree(g)
is_simple(g)   # sometimes TRUE, but can be FALSE
g2 <- sample_degseq(1:10, 10:1)
degree(g2, mode="out")
degree(g2, mode="in")

## The vl generator
g3 <- sample_degseq(rep(2,100), method="vl")
degree(g3)
is_simple(g3)  # always TRUE

## Exponential degree distribution
## Note, that we correct the degree sequence if its sum is odd
degs <- sample(1:100, 100, replace=TRUE, prob=exp(-0.5*(1:100)))
if (sum(degs) %% 2 != 0) { degs[1] <- degs[1] + 1 }
g4 <- sample_degseq(degs, method="vl")
all(degree(g4) == degs)

## Power-law degree distribution
## Note, that we correct the degree sequence if its sum is odd
degs <- sample(1:100, 100, replace=TRUE, prob=(1:100)^-2)
if (sum(degs) %% 2 != 0) { degs[1] <- degs[1] + 1 }
g5 <- sample_degseq(degs, method="vl")
all(degree(g5) == degs)




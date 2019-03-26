library(eRm)


### Name: stepwiseIt
### Title: Stepwise item elimination
### Aliases: stepwiseIt stepwiseIt.eRm print.step
### Keywords: models

### ** Examples


## 2pl-data, 100 persons, 10 items
set.seed(123)
X <- sim.2pl(500, 10, 0.4)
res <- RM(X)

## elimination according to itemfit
stepwiseIt(res, criterion = list("itemfit"))      

## Wald test based on mean splitting
stepwiseIt(res, criterion = list("Waldtest","mean")) 

## Andersen LR-test based on random split
set.seed(123)
groupvec <- sample(1:3, 500, replace = TRUE)
stepwiseIt(res, criterion = list("LRtest",groupvec))





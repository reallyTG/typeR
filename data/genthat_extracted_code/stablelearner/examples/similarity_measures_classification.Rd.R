library(stablelearner)


### Name: similarity_measures_classification
### Title: Similarity Measure Infrastructure for Stability Assessment with
###   Ordinal Responses
### Aliases: similarity_measures similarity_measures_classification clagree
###   ckappa bdist tvdist hdist jsdiv
### Keywords: stability, similariy, measures

### ** Examples


## No test: 

set.seed(0)

## build trees
library("partykit")
m1 <- ctree(Species ~ ., data = iris[sample(1:nrow(iris), replace = TRUE),])
m2 <- ctree(Species ~ ., data = iris[sample(1:nrow(iris), replace = TRUE),])

p1 <- predict(m1, type = "prob")
p2 <- predict(m2, type = "prob")

## class agreement
m <- clagree()
m$measure(p1, p2)

## cohen's kappa
m <- ckappa()
m$measure(p1, p2)

## bhattacharayya distance
m <- bdist()
m$measure(p1, p2)

## total variation distance
m <- tvdist()
m$measure(p1, p2)

## hellinger distance
m <- hdist()
m$measure(p1, p2)

## jenson-shannon divergence
m <- jsdiv()
m$measure(p1, p2)

## jenson-shannon divergence (base = exp(1))
m <- jsdiv(base = exp(1))
m$measure(p1, p2)

## End(No test)





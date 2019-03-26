library(ltm)


### Name: grm
### Title: Graded Response Model - Polytomous IRT
### Aliases: grm
### Keywords: multivariate regression

### ** Examples


## The Graded Response model for the Science data:
grm(Science[c(1,3,4,7)])

## The Graded Response model for the Science data,
## assuming equal discrimination parameters across items:
grm(Science[c(1,3,4,7)], constrained = TRUE)

## The Graded Response model for the Environment data
grm(Environment)





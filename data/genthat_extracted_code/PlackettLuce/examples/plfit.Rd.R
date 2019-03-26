library(PlackettLuce)


### Name: plfit
### Title: PlackettLuce Wrapper for Model-based Recursive Partitioning
### Aliases: plfit
### Keywords: internal

### ** Examples

# rankings
R <- matrix(c(1, 2, 0, 0,
              4, 1, 2, 3,
              2, 1, 1, 1,
              1, 2, 3, 0,
              2, 1, 1, 0,
              1, 0, 3, 2), nrow = 6, byrow = TRUE)
colnames(R) <- c("apple", "banana", "orange", "pear")

# group rankings into two groups
G <- grouped_rankings(R, rep(1:2, 3))

# plfit() gives the same results as PlackettLuce()
pl <- plfit(G)
pl$coefficients
-pl$objfun

mod <- PlackettLuce(R)
coef(mod)
logLik(mod)




library(copula)


### Name: plot-methods
### Title: Methods for 'plot' in Package 'copula'
### Aliases: plot-methods plot,Copula,ANY-method plot,mvdc,ANY-method
### Keywords: hplot

### ** Examples

## For 2-dim. 'copula' objects -------------------------
## Plot uses  n  compula samples
n <- 1000 # sample size
set.seed(271) # (reproducibility)
plot(tCopula(-0.8, df = 1.25), n = n) # automatic main title!

nu <- 3 # degrees of freedom
tau <- 0.5 # Kendall's tau
th <- iTau(tCopula(df = nu), tau) # corresponding parameter
cop <- tCopula(th, df = nu) # define 2-d copula object
plot(cop, n = n)

## For 2-dim. 'mvdc' objects ---------------------------
mvNN <- mvdc(cop, c("norm", "norm"),
             list(list(mean = 0, sd = 1), list(mean = 1)))
plot(mvNN, n = n)




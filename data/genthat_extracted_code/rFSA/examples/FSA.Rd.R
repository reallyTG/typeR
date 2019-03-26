library(rFSA)


### Name: FSA
### Title: FSA: Feasible Solution Algorithm
### Aliases: FSA lmFSA glmFSA

### ** Examples


N <- 10 #number of obs
P <- 100 #number of variables
data <- data.frame(matrix(rnorm(N*(P+1)), nrow = N, ncol = P+1))

sln <- FSA(formula = "X101~1", data = data, cores = 1, m = 2,
interactions = FALSE, criterion = AIC, minmax = "min",
numrs = 10)
sln





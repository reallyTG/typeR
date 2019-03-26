library(MissMech)


### Name: DelLessData
### Title: Removes groups with identical missing data patterns having at
###   most a given number of cases
### Aliases: DelLessData

### ** Examples

set.seed <- 50
n <- 200
p <- 4
pctmiss <- 0.2
y <- matrix(rnorm(n * p),nrow = n)
missing <- matrix(runif(n * p), nrow = n) < pctmiss
y[missing] <- NA
out <- DelLessData(data=y, ncases = 4)
dim(y)
dim(out$data)




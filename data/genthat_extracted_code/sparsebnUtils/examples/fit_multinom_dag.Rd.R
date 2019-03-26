library(sparsebnUtils)


### Name: fit_multinom_dag
### Title: Inference in discrete Bayesian networks
### Aliases: fit_multinom_dag

### ** Examples


### construct a random data set
x <- c(0,1,0,1,0)
y <- c(1,0,1,0,1)
z <- c(0,1,2,1,0)
a <- c(1,1,1,0,0)
b <- c(0,0,1,1,1)
dat <- data.frame(x, y, z, a, b)

### randomly construct an edgelist of a graph
nnode <- ncol(dat)
li <- vector("list", length = nnode)
li[[1]] <- c(2L,4L)
li[[2]] <- c(3L,4L,5L)
li[[3]] <- integer(0)
li[[4]] <- integer(0)
li[[5]] <- integer(0)
edgeL <- edgeList(li)

### run fit_multinom_dag
fit.multinom <- fit_multinom_dag(edgeL, dat)





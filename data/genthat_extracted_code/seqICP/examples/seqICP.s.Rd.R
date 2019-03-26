library(seqICP)


### Name: seqICP.s
### Title: Sequential Invariant Causal Prediction for an individual set S
### Aliases: seqICP.s

### ** Examples

set.seed(1)

# environment 1
na <- 130
X1a <- rnorm(na,0,0.1)
Ya <- 5*X1a+rnorm(na,0,0.5)
X2a <- Ya+rnorm(na,0,0.1)

# environment 2
nb <- 70
X1b <- rnorm(nb,-1,1)
Yb <- 5*X1b+rnorm(nb,0,0.5)
X2b <- rnorm(nb,0,0.1)

# combine environments
X1 <- c(X1a,X1b)
X2 <- c(X2a,X2b)
Y <- c(Ya,Yb)
Xmatrix <- cbind(X1, X2)

# apply seqICP.s to all possible sets - only the true parent set S=1
# is invariant in this example
seqICP.s(Xmatrix, Y, S=numeric(), par.test=list(grid=c(0,50,100,150,200)))
seqICP.s(Xmatrix, Y, S=1, par.test=list(grid=c(0,50,100,150,200)))
seqICP.s(Xmatrix, Y, S=2, par.test=list(grid=c(0,50,100,150,200)))
seqICP.s(Xmatrix, Y, S=c(1,2), par.test=list(grid=c(0,50,100,150,200)))




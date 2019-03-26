library(seqICP)


### Name: seqICP
### Title: Sequential Invariant Causal Prediction
### Aliases: seqICP

### ** Examples

set.seed(1)

# environment 1
na <- 140
X1a <- 0.3*rnorm(na)
X3a <- X1a + 0.2*rnorm(na)
Ya <- -.7*X1a + .6*X3a + 0.1*rnorm(na)
X2a <- -0.5*Ya + 0.5*X3a + 0.1*rnorm(na)

# environment 2
nb <- 80
X1b <- 0.3*rnorm(nb)
X3b <- 0.5*rnorm(nb)
Yb <- -.7*X1b + .6*X3b + 0.1*rnorm(nb)
X2b <- -0.5*Yb + 0.5*X3b + 0.1*rnorm(nb)

# combine environments
X1 <- c(X1a,X1b)
X2 <- c(X2a,X2b)
X3 <- c(X3a,X3b)
Y <- c(Ya,Yb)
Xmatrix <- cbind(X1, X2, X3)

# Y follows the same structural assignment in both environments
# a and b (cf. the lines Ya <- ... and Yb <- ...).
# The direct causes of Y are X1 and X3.
# A linear model considers X1, X2 and X3 as significant.
# All these variables are helpful for the prediction of Y.
summary(lm(Y~Xmatrix))

# apply seqICP to the same setting
seqICP.result <- seqICP(X = Xmatrix, Y,
par.test = list(grid = seq(0, na + nb, (na + nb)/10), complements = FALSE, link = sum,
alpha = 0.05, B =100), max.parents = 4, stopIfEmpty=FALSE, silent=FALSE)
summary(seqICP.result)
# seqICP is able to infer that X1 and X3 are causes of Y




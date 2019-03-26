library(robFitConGraph)


### Name: robFitConGraph
### Title: Graph-constrained robust scatter estimation.
### Aliases: robFitConGraph

### ** Examples

# --- build a graphical model ---

chordless.p.cycle <- function(rho,p){
  M <- diag(1,p)
  for (i in 1:(p-1)) M[i,i+1] <- M[i+1,i] <- -rho
  M[1,p] <- M[p,1] <- -rho
  return(M)
}
p <- 7                             # number of variables
rho <- 0.4                         # partial correlation
PCM <- chordless.p.cycle(rho,p)    # partial correlation matrix
SM <- cov2cor(solve(PCM))          # shape matrix (i.e covariance matrix up to scale)
model <- abs(sign(PCM))            # adjacency matrix of the chordless-7-cycle
# > model
#      [,1] [,2] [,3] [,4] [,5] [,6] [,7]
# [1,]    1    1    0    0    0    0    1
# [2,]    1    1    1    0    0    0    0
# [3,]    0    1    1    1    0    0    0
# [4,]    0    0    1    1    1    0    0
# [5,]    0    0    0    1    1    1    0
# [6,]    0    0    0    0    1    1    1
# [7,]    1    0    0    0    0    1    1

# This is the cordless-7-cycle (p.872 Figure 1 (a) in Vogel & Tyler, 2014).
# All non-zero partial correlations are 0.4.
# The true covariance is (up to scale) 'SM'. This matrix is constructed such
# that it has zero entries in its inverse as specified by 'model'.


# --- generate data from the graphical model ---

n <- 50            # number of observations
df.data <- 3       # degrees of freedom
library(mvtnorm)   # for rmvt function
set.seed(918273)   # for reproducability
X <- rmvt(n=n,sigma=SM,df=df.data)

# X contains a data set of size n = 50 and dimension p = 7, sampled from the
# elliptical t-distribution with 3 degrees of freedom and shape matrix 'SM'


# --- compare estimates ---

# We compute three scatter estimates:

# 1) the direct graph-constrained t-MLE estimator:
S1 <- robFitConGraph(X, amat=model, df=df.data, plug.in=FALSE, direct=TRUE)$Shat
round(S1,d=2)

# 2) the plug-in graph-constrained t-MLE estimator:
S2 <- robFitConGraph(X, amat=model, df=df.data, plug.in=TRUE, direct=FALSE)$Shat
round(S2,d=2)

# 3) the saple covariance matrix:
round(cov(X),d=2)

# S1 and S2 are very similar. In Vogel & Tyler, 2014, it is shown that they
# are asymptotically equivalent as n goes to infinity.
# The sample covariance matrix substantially differs from S1 and S2. Note that
# S1 and S2 just estimate a multiple of the true covariance matrix (similarly
# SM is just proportional to the true covariance matrix). Therefore, consider
# correlation estimates based on the various scatter estimators:

# the true correlation matrix:
round(cov2cor(SM),d=2)

# sample correlations:
round(cov2cor(cov(X)),d=2)

# robust correlations based on the direct graph-constrained t-MLE:
round(cov2cor(S1),d=2)

# robust correlations based on the plug.in graph-constrained t-MLE:
round(cov2cor(S2),d=2)

# The correlation estimates based on S1 and S2 are close to the true
# correlations, whereas the sample correlations, again, differ strongly.
# Note: sample correlations are not asymptotically normal at the t3 distribution.





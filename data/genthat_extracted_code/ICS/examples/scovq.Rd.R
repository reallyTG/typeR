library(ICS)


### Name: scovq
### Title: Supervised scatter matrix based on quantiles
### Aliases: scovq
### Keywords: multivariate

### ** Examples

# Creating some data

# The number of explaining variables
p <- 10
# The number of observations
n <- 400
# The error variance
sigma <- 0.5
# The explaining variables 
X <- matrix(rnorm(p*n),n,p)
# The error term
epsilon <- rnorm(n, sd = sigma)
# The response
y <- X[,1]^2 + X[,2]^2*epsilon


# SICS with ics

X.centered <- sweep(X,2,colMeans(X),"-")
SICS <- ics(X.centered, S1=cov, S2=scovq, S2args=list(y=y, q1=0.25, 
        q2=0.75, pos=FALSE), stdKurt=FALSE, stdB="Z")

# Assuming it is known that k=2, then the two directions 
# of interest are choosen as:

k <- 2
KURTS <- SICS@gKurt 
KURTS.max <- ifelse(KURTS >= 1, KURTS, 1/KURTS)
ordKM <- order(KURTS.max, decreasing = TRUE)

indKM <- ordKM[1:k]

# The two variables of interest
Zk <- ics.components(SICS)[,indKM]

# The correspondings transformation matrix
Bk <- coef(SICS)[indKM,]

# The corresponding projection matrix
Pk <- t(Bk) %*% solve(Bk %*% t(Bk)) %*% Bk

# Visualization
pairs(cbind(y,Zk))

# checking the subspace difference

# true projection

B0 <- rbind(rep(c(1,0),c(1,p-1)),rep(c(0,1,0),c(1,1,p-2)))
P0 <- t(B0) %*% solve(B0 %*% t(B0)) %*% B0

# crone and crosby subspace distance measure, should be small
k - sum(diag(P0 %*% Pk))





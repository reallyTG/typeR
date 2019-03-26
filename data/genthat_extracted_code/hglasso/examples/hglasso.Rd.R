library(hglasso)


### Name: hglasso
### Title: Hub graphical lasso
### Aliases: hglasso

### ** Examples

##############################################
# Example from Figure 1 in the manuscript
# A toy example to illustrate the results from 
# Hub Graphical Lasso
##############################################
library(mvtnorm)
library(glasso)
set.seed(1)
n=100
p=100

# A network with 4 hubs
network<-HubNetwork(p,0.99,4,0.1)
Theta <- network$Theta
truehub <- network$hubcol
# The four hub nodes have indices 14, 42, 45, 78
print(truehub)

# Generate data matrix x
x <- rmvnorm(n,rep(0,p),solve(Theta))
x <- scale(x)

# Run Hub Graphical Lasso to estimate the inverse covariance matrix
res1 <- hglasso(cov(x),0.3,0.3,1.5)

# print out a summary of the object hglasso
summary(res1)
# we see that the estimated hub nodes have indices 14, 42, 45, 78
# We successfully recover the 4 hub nodes

# Run hglasso using with and without warm start.  
# system.time(hglasso(cov(x),0.31,0.3,1.5))

# system.time(hglasso(cov(x),0.31,0.3,1.5,start="warm",var.init=res1))

# Run hglasso with larger lambda2, encouraging the hub nodes to be more sparse
res2 <- hglasso(cov(x),0.3,0.35,1.5)

# Run hglasso with lambda2=lambda3=100000, the solution is the 
# same as the graphical lasso solution obtain from glasso package
res3 <- hglasso(cov(x),0.3)
res4 <- glasso(cov(x),0.3,penalize.diagonal=FALSE)
# print the frobenius norm of the difference between the two estimates
print(sum((res3$Theta-res4$wi)^2))





library(hglasso)


### Name: hcov
### Title: Hub covariance graph
### Aliases: hcov

### ** Examples

#############################################
# Example for estimating covariance matrix
# with hubs
##############################################
library(mvtnorm)
set.seed(1)
n=100
p=100

# a covariance with 4 hubs

network <- HubNetwork(p,0.95,4,0.1,type="covariance")
Sigma <- network$Theta
hubind <- network$hubcol
x <- rmvnorm(n,rep(0,p),Sigma)
x <- scale(x)

# Estimate the covariance matrix
res1<-hcov(cov(x),0.3,0.2,1.2)
summary(res1)
# correctly identified two of the hub nodes

# Plot the matrices V and Z 
image(res1)
dev.off()
# Plot a graphical representation of the estimated covariance matrix --- covariance graph
plot(res1)

# Xue et al cannot identified any hub nodes
res2 <- hcov(cov(x),0.3)
summary(res2)
plot(res2)





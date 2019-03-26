library(hglasso)


### Name: hglasso-package
### Title: Fit the hub graphical lasso, hub covariance graph, and hub
###   binary network
### Aliases: hglasso-package
### Keywords: package

### ** Examples

##############################################
# Example from Figure 1 in the manuscript
# A toy example to illustrate the results from 
# Hub Graphical Lasso
##############################################
#library(mvtnorm)
#set.seed(1)
#n=100
#p=100

# A network with 4 hubs
#network<-HubNetwork(p,0.99,4,0.1)
#Theta <- network$Theta
#truehub <- network$hubcol
# The four hub nodes have indices 14, 42, 45, 78
#print(truehub)

# Generate data matrix x
#x <- rmvnorm(n,rep(0,p),solve(Theta))
#x <- scale(x)

# Run Hub Graphical Lasso to estimate the inverse covariance matrix
# res1<-hglasso(cov(x),0.3,0.3,1.5)

# print out a summary of the object hglasso
#summary(res1)
# we see that the estimated hub nodes have indices 14, 42, 45, 78
# We successfully recover the 4 hub nodes

# Plot the matrices V and Z 
#image(res1)
#dev.off()
# Plot a graphical representation of the estimated inverse
# covariance matrix --- conditional independence graph
#plot(res1,main="Conditional Independence Graph")





library(hglasso)


### Name: plot.hglasso
### Title: Plot an object of class 'hglasso', 'hcov', or 'hbn'
### Aliases: plot.hglasso plot.hcov plot.hbn

### ** Examples

##############################################
# Example from Figure 1 in the manuscript
# A toy example to illustrate the results from 
# Hub Graphical Lasso
##############################################
library(mvtnorm)
set.seed(1)
n=100
p=100

# A network with 4 hubs
Theta<-HubNetwork(p,0.99,4,0.1)$Theta

# Generate data matrix x
x <- rmvnorm(n,rep(0,p),solve(Theta))
x <- scale(x)

# Run Hub Graphical Lasso to estimate the inverse covariance matrix
res1 <- hglasso(cov(x),0.3,0.3,1.5)

# Graphical representation of the estimated Theta
plot(res1,main="conditional independence graph")





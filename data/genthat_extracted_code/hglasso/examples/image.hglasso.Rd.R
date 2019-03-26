library(hglasso)


### Name: image.hglasso
### Title: Image plot of an object of class 'hglasso', 'hcov', or 'hbn'
### Aliases: image.hglasso image.hcov image.hbn

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
res1 <- hglasso(cov(x),0.3,0.2,2)

# image plots for the matrix V and Z
image(res1)
dev.off()





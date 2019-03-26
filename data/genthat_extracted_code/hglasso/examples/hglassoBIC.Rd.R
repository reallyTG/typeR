library(hglasso)


### Name: hglassoBIC
### Title: BIC-type criterion for 'hglasso'
### Aliases: hglassoBIC

### ** Examples

#library(mvtnorm)
#library(glasso)
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
#S <- cov(x)
# Run Hub Graphical Lasso with different tuning parameters
#lambdas2 <- seq(0,0.5,by=0.05)
#BICcriterion <- NULL
#for(lambda2 in lambdas2){
#res1 <- hglasso(S,0.3,lambda2,1.5)
#BICcriterion <- c(BICcriterion,hglassoBIC(res1,S)$BIC)
#}
#lambda2 <- lambdas2[which(BICcriterion==min(BICcriterion))]




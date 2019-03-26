library(GGMselect)


### Name: selectMyFam
### Title: Select a graph within a given family of graphs in Gaussian
###   Graphical Modeling.
### Aliases: selectMyFam
### Keywords: models multivariate graphs

### ** Examples

p=30
n=30
# generate graph
eta=0.11
Gr <- simulateGraph(p,eta)
# generate data
X <- rmvnorm(n, mean=rep(0,p), sigma=Gr$C)
# generate a family of candidate graphs with glasso
library("glasso")
MyFamily <- NULL
for (j in 1:3){
  MyFamily[[j]] <- abs(sign(glasso(cov(X),rho=j/5)$wi))
  diag(MyFamily[[j]]) <- 0
}
# select a graph within MyFamily
GMF <- selectMyFam(X,MyFamily)
# plot the result
library(network)
par(mfrow=c(1,2))
gV <- network(Gr$G)
plot(gV,jitter=TRUE, usearrows = FALSE, label=1:p,displaylabels=TRUE)
gMyFam <- network(GMF$G)
plot(gMyFam, jitter=TRUE, usearrows = FALSE,  label=1:p,displaylabels=TRUE)




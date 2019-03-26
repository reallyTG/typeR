library(mvMORPH)


### Name: LRT
### Title: Likelihood Ratio Test
### Aliases: LRT
### Keywords: LRT Loglikelihood ratio test Models comparison

### ** Examples



## Simulated dataset
set.seed(14)
# Generating a random tree
tree<-pbtree(n=50)

# Setting the regime states of tip species
sta<-as.vector(c(rep("Forest",20),rep("Savannah",30))); names(sta)<-tree$tip.label

# Making the simmap tree with mapped states
tree<-make.simmap(tree,sta , model="ER", nsim=1)
col<-c("blue","orange"); names(col)<-c("Forest","Savannah")

# Plot of the phylogeny for illustration
plotSimmap(tree,col,fsize=0.6,node.numbers=FALSE,lwd=3, pts=FALSE)

# Simulate two correlated traits evolving along the phylogeny
traits<-mvSIM(tree,nsim=1, model="BMM", param=list(sigma=list(matrix(c(2,1,1,1.5),2,2),
         matrix(c(4,1,1,4),2,2)), ntraits=2, names_traits=c("head.size","mouth.size")))

# Fit of model 1
mod1<-mvBM(tree,traits,model="BMM")

# Fit of model 2
mod2<-mvBM(tree,traits,model="BM1")

# comparing the fit using LRT...
LRT(mod1,mod2)


## No test: 
# Simulation based test
nsim = 500
boot <- simulate(mod2, tree=tree, nsim=nsim)
simulations <- sapply(1:nsim, function(i){
  mod1boot<-mvBM(tree, boot[[i]], model="BMM", diagnostic=F, echo=F)
  mod2boot<-mvBM(tree, boot[[i]], model="BM1", diagnostic=F, echo=F, method="pic")
  2*(mod1boot$LogLik-mod2boot$LogLik)
})

# Compute the p-value
LRT_stat<-(2*((mod1$LogLik-mod2$LogLik)))
mean(simulations>=LRT_stat)

plot(density(simulations), main="Non-parametric LRT");
abline(v=LRT_stat, col="red")
## End(No test)





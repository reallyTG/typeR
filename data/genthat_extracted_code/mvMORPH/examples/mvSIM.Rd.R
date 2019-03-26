library(mvMORPH)


### Name: mvSIM
### Title: Simulation of (multivariate) continuous traits on a phylogeny
### Aliases: mvSIM
### Keywords: simulate traits mvmorph object

### ** Examples


## Simulated dataset
set.seed(14)
# Generating a random tree with 50 species
tree<-pbtree(n=50)

# Setting the regime states of tip species
sta<-as.vector(c(rep("Forest",20),rep("Savannah",30))); names(sta)<-tree$tip.label

# Making the simmap tree with mapped states
tree<-make.simmap(tree,sta , model="ER", nsim=1)
col<-c("blue","orange"); names(col)<-c("Forest","Savannah")

# Plot of the phylogeny for illustration
plotSimmap(tree,col,fsize=0.6,node.numbers=FALSE,lwd=3, pts=FALSE)

## Simulate trait evolution according to a bivariate "BMM" model
# Number of traits
ntraits<-2
# Number of simulated (pairs of) traits
nsim<-10
# Rates matrices for the "Forest" and the "Savannah" regimes
sigma<-list(Forest=matrix(c(2,0.5,0.5,1),2), Savannah=matrix(c(5,3,3,4),2))
# ancestral states for each traits
theta<-c(0,0)

# Simulate
simul<-mvSIM(tree,nsim=nsim, model="BMM",param=list(ntraits=ntraits,sigma=sigma,theta=theta))

# Try to fit a "BM1" model to the first simulated dataset
model_fit<-mvBM(tree,simul[[1]],model="BM1")

# Use the estimated parameters to simulate new traits!
simul2<-mvSIM(tree,nsim=nsim,param=model_fit)

# or try with generic "simulate" function
simul3<-simulate(model_fit,nsim=nsim,tree=tree)

## Just-for-fun :Comparing parameters
## No test: 
 simul4<-simulate(model_fit,nsim=100,tree=tree)
 
 results<-lapply(simul4,function(x){
    mvBM(tree,x,model="BM1",method="pic", echo=F,diagnostic=F)
    })

 sigma_simul<-sapply(results,function(x){x$sigma})

# comparison between the simulated (black) and the observed (red) multivariate rates
 layout(matrix(1:4, ncol=2))
 for(i in 1:4){
	  hist(sigma_simul[i,], main=paste("Estimated sigma on simulated traits"),
  	xlab="estimated sigma for 100 replicates");abline(v=mean(sigma_simul[i,]),lwd=2);
  	abline(v=model_fit$sigma[i],col="red",lwd=2)
 }
	
## End(No test)




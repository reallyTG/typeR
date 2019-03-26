library(mvMORPH)


### Name: mvBM
### Title: Multivariate Brownian Motion models of continuous traits
###   evolution
### Aliases: mvBM
### Keywords: Brownian Motion Evolutionary rates Cholesky constraint

### ** Examples

# Simulated dataset
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

# Simulate the traits
sigma<-matrix(c(0.1,0.05,0.05,0.1),2)
theta<-c(0,0)
data<-mvSIM(tree, param=list(sigma=sigma, ntraits=2, theta=theta,
            names_traits=c("head.size","mouth.size")), model="BM1", nsim=1)

## Fitting the models
# BMM - Analysis with multiple rates
mvBM(tree, data)

# BM1 - Analysis with a unique rate matrix
fit1<-mvBM(tree, data, model="BM1", method="pic")

# BM1 constrained
fit2<-mvBM(tree, data, model="BM1", method="pic", param=list(constraint="equal"))

# Comparison with LRT test
LRT(fit1,fit2)

# Random starting values
mvBM(tree, data, model="BMM", method="sparse", param=list(sigma=list(runif(3), runif(3))))

# Specified starting values (from the Cholesky factor)
chol_factor<-chol(sigma)
starting_values<-chol_factor[upper.tri(chol_factor,TRUE)]
mvBM(tree, data, model="BMM", method="sparse",
    param=list( sigma=list(starting_values, starting_values)))


# Multiple mean
mvBM(tree, data, model="BMM", method="sparse", param=list(smean=FALSE))


# Introduce some missing cases (NA values)
data2<-data
data2[8,2]<-NA
data2[25,1]<-NA

mvBM(tree, data2, model="BM1")


## FAST FOR THE UNIVARIATE CASE!!
## No test: 
 set.seed(14)
 tree2<-pbtree(n=5416) # Number of Mammal species
# Setting the regime states of tip species
 sta<-as.vector(c(rep("group_1",2000),rep("group_2",3416))); names(sta)<-tree2$tip.label

# Making the simmap tree with mapped states
 tree2<-make.simmap(tree2,sta , model="ER", nsim=1)
 col<-c("blue","orange"); names(col)<-c("Group_1","Group_2")
 plotSimmap(tree2,col,fsize=0.6,node.numbers=FALSE,lwd=3, pts=FALSE)

# Simulate a trait evolving by brownian motion on the tree
 trait<-rTraitCont(tree2)

# Fitting the models
 mvBM(tree2, trait, model="BMM", method="pic")
 mvBM(tree2, trait, model="BM1", method="pic")
## End(No test)





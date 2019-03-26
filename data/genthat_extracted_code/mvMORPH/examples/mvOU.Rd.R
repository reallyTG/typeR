library(mvMORPH)


### Name: mvOU
### Title: Multivariate Ornstein-Uhlenbeck model of continuous traits
###   evolution
### Aliases: mvOU
### Keywords: Ornstein Uhlenbeck Hessian OU

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
alpha<-matrix(c(2,0.5,0.5,1),2)
sigma<-matrix(c(0.1,0.05,0.05,0.1),2)
theta<-c(2,3,1,1.3)
data<-mvSIM(tree, param=list(sigma=sigma, alpha=alpha, ntraits=2, theta=theta,
            names_traits=c("head.size","mouth.size")), model="OUM", nsim=1)

## Fitting the models
## No test: 
# OUM - Analysis with multiple optima
 mvOU(tree, data)

# OU1 - Analysis with a unique optimum
 mvOU(tree, data, model="OU1", method="sparse")

# various options
mvOU(tree, data, model="OUM", method="sparse", scale.height=FALSE,
    param=list(decomp="svd", root="stationary"))# non-symmetric alpha
mvOU(tree, data, model="OUM", method="sparse", scale.height=FALSE,
    param=list(decomp="qr", root=TRUE)) # non-symmetric alpha
mvOU(tree, data, model="OUM", method="sparse", scale.height=FALSE,
    param=list(decomp="cholesky", root=TRUE)) # symmetric-positive
# OUCH setting
mvOU(tree, data, model="OUM", method="rpf", scale.height=FALSE,
    param=list(decomp="cholesky", root=FALSE, vcv="ouch"))

## Univariate case - FAST with RPF
 set.seed(14)
 tree<-pbtree(n=500)

# Setting the regime states of tip species
 sta<-as.vector(c(rep("Forest",200),rep("Savannah",300))); names(sta)<-tree$tip.label

# Making the simmap tree with mapped states
 tree<-make.simmap(tree,sta , model="ER", nsim=1)
 col<-c("blue","orange"); names(col)<-c("Forest","Savannah")

# Plot of the phylogeny for illustration
 plotSimmap(tree,col,fsize=0.6,node.numbers=FALSE,lwd=3, pts=FALSE)

# Parameters
 alpha<-2.5
 sigma<-0.1
 theta<-c(0,2)
 data<-mvSIM(tree, param=list(sigma=sigma, alpha=alpha, ntraits=1, theta=theta,
             names_traits=c("body_size")), model="OUM", nsim=1)

# Fit the model
 system.time(mvOU(tree, data, model="OUM", method="univarpf",
                param=list(root="stationary")))
 system.time(mvOU(tree, data, model="OU1", method="univarpf",
                param=list(root="stationary")))

# Add measurement error
 error=rnorm(500,sd=0.1)
 mvOU(tree, data, error=error^2, model="OUM", method="univarpf",
    param=list(root="stationary"))

	
## End(No test)




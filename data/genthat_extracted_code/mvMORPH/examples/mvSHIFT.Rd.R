library(mvMORPH)


### Name: mvSHIFT
### Title: Multivariate change in mode of continuous trait evolution
### Aliases: mvSHIFT
### Keywords: Ornstein Uhlenbeck Shifts Brownian Motion Evolutionary rates
###   Early-Burst RR EC SR ER

### ** Examples

# Simulated dataset
set.seed(14)
# Generating a random tree
tree<-rtree(50)

# Providing a tree whith the shift mapped on
tot<-max(nodeHeights(tree))
age=tot-3    # The shift occured 3 Ma ago
tree<-make.era.map(tree,c(0,age))

# Plot of the phylogeny for illustration
plotSimmap(tree,fsize=0.6,node.numbers=FALSE,lwd=3, pts=FALSE)

# Simulate the traits
alpha<-matrix(c(2,0.5,0.5,1),2)
sigma<-matrix(c(0.1,0.05,0.05,0.1),2)
theta<-c(2,3)
data<-mvSIM(tree, param=list(sigma=sigma, alpha=alpha, ntraits=2, theta=theta,
            names_traits=c("head.size","mouth.size")), model="ER", nsim=1)


## Fitting the models
# "Ecological release model"
mvSHIFT(tree, data, model="OUBM") # similar to mvSHIFT(tree, data, model="ER")

# "Release and radiate model"
## No test: 
 mvSHIFT(tree, data, model="RR", method="sparse")
# similar to mvSHIFT(tree, data, model="OUBMi")

# More generally...

# OU to/from BM
 mvSHIFT(tree, data, model="OUBM", method="sparse")
 mvSHIFT(tree, data, model="BMOU", method="sparse")
 mvSHIFT(tree, data, model="OUBMi", method="sparse")
 mvSHIFT(tree, data, model="BMOUi", method="sparse")

# BM to/from EB
 mvSHIFT(tree, data, model="BMEB", method="sparse")
 mvSHIFT(tree, data, model="EBBM", method="sparse")
 mvSHIFT(tree, data, model="BMEBi", method="sparse")
 mvSHIFT(tree, data, model="EBBMi", method="sparse")

# OU to/from EB
 mvSHIFT(tree, data, model="OUEB", method="sparse")
 mvSHIFT(tree, data, model="OUEBi", method="sparse")
 mvSHIFT(tree, data, model="EBOU", method="sparse")
 mvSHIFT(tree, data, model="EBOUi", method="sparse")


## Without providing mapped tree
# The shift occured 3Ma ago (param$age=3)
 set.seed(14)
 tree<-rtree(50)
 data<-mvSIM(tree, param=list(sigma=sigma, alpha=alpha, ntraits=2, theta=theta,
            names_traits=c("head.size","mouth.size"), age=3), model="ER", nsim=1)

## Fitting the models without mapped tree but by specifying the age in the param list.
 mvSHIFT(tree, data, model="OUBM", param=list(age=3))
## End(No test)




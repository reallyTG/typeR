library(OUwie)


### Name: OUwie.joint
### Title: Joint optimization for multiple traits
### Aliases: OUwie.joint
### Keywords: models

### ** Examples

#data(tworegime)

#trait1 <- OUwie.sim(tree,trait, alpha=pp$solution[1,], 
#sigma.sq=pp$solution[2,],theta=pp$theta[,1], theta0=pp$theta[1,1])
#trait2 <- OUwie.sim(tree,trait, alpha=pp$solution[1,], 
#sigma.sq=pp$solution[2,],theta=pp$theta[,1], theta0=pp$theta[1,1])
#trait.multi <- cbind(trait[,1:2],trait1[,3],trait2[,3])

##Fit a global OUMV model applied to all traits:
#oumv.global <- OUwie.joint(tree,trait.multi, model="OUMV", ntraits=2, allfree=FALSE)

##Now fit a OUMV model applied to each separately, but optimized jointly:
#oumv.joint <- OUwie.joint(tree,trait.multi, model="OUMV", ntraits=2, allfree=TRUE)




library(MixGHD)


### Name: MGHFA
### Title: Mixture of generalized hyperbolic factor analyzers (MGHFA).
### Aliases: MGHFA
### Keywords: Clustering Classification Generalized hyperboilc distribution

### ** Examples

## Classification
#70% belong to the training set
data(sonar)
 label=sonar[,61]
 set.seed(4)
 a=round(runif(62)*207+1)
 label[a]=0
 
 
##model estimation
model=MGHFA(data=sonar[,1:60],  G=2, max.iter=25  ,q=2,label=label)

#result
table(model@map,sonar[,61])
summary(model)




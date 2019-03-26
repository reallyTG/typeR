library(MixGHD)


### Name: MGHD
### Title: Mixture of generalized hyperbolic distributions (MGHD).
### Aliases: MGHD
### Keywords: Clustering Classification Generalized hyperboilc distribution

### ** Examples

##loading crabs data
data(crabs)

##model estimation
model=MGHD(data=crabs[,4:8],  G=2   )

#result
plot(model)
table(model@map, crabs[,2])

## Classification
##loading bankruptcy data
data(bankruptcy)
#70% belong to the training set
 label=bankruptcy[,1]
#for a Classification porpuse the label cannot be 0
 label[1:33]=2
 a=round(runif(20)*65+1)
 label[a]=0
 
 
##model estimation
model=MGHD(data=bankruptcy[,2:3],  G=2, label=label )

#result
table(model@map,bankruptcy[,1])
plot(model)



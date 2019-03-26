library(MixGHD)


### Name: summary
### Title: Plot objects of class MixGHD.
### Aliases: summary.MixGHD summary
### Keywords: Clustering methods

### ** Examples

##loading banknote data
data(bankruptcy)


##model estimation
model=MSGHD(bankruptcy[,2:3],G=2,max.iter=30)

#result

summary(model)



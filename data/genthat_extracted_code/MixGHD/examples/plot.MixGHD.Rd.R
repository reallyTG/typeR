library(MixGHD)


### Name: plot
### Title: Plot objects of class MixGHD.
### Aliases: plot.MixGHD plot,MixGHD-method plot,MixGHD,missing-method
### Keywords: Clustering Plot

### ** Examples

##loading banknote data
data(bankruptcy)


##model estimation
model=MCGHD(bankruptcy[,2:3],G=2,max.iter=30)

#result

plot(model)



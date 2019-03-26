library(MixGHD)


### Name: MixGHD-class
### Title: Class MixGHD.
### Aliases: MixGHD-class
### Keywords: Clustering Plot

### ** Examples

##loading banknote data
data(bankruptcy)


##model estimation
model=MSGHD(bankruptcy[,2:3],G=2,max.iter=30)

#result
summary(model)
plot(model)



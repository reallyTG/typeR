library(MixGHD)


### Name: DA
### Title: Discriminant analysis using the mixture of generalized
###   hyperbolic distributions.
### Aliases: DA
### Keywords: Clustering Generalized hyperboilc distribution

### ** Examples

##loading banknote data
data(banknote)
banknote[,1]=as.numeric(factor(banknote[,1]))


##divide the data in training set and test set
train=banknote[c(1:74,126:200),]
test=banknote[75:125,]

##model estimation
 model=DA(train[,2:7],train[,1],test[,2:7],test[,1],method="MSGHD",max.iter=20)

#result
model$ARItest



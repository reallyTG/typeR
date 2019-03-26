library(MixGHD)


### Name: MSGHD
### Title: Mixture of multiple scaled generalized hyperbolic distributions
###   (MSGHD).
### Aliases: MSGHD
### Keywords: Clustering Generalized hyperboilc distribution

### ** Examples

##loading banknote data
data(banknote)


##model estimation
model=MSGHD(banknote[,2:7],G=2,max.iter=30)

#result
table(banknote[,1],model@map)
summary(model)
plot(model)



library(MixGHD)


### Name: MCGHD
### Title: Mixture of coalesced generalized hyperbolic distributions
###   (MCGHD).
### Aliases: MCGHD
### Keywords: Clustering Generalized hyperboilc distribution

### ** Examples

##loading banknote data
data(banknote)

##model estimation
model=MCGHD(banknote[,2:7],G=2,max.iter=20)

#result
#summary(model)
#plot(model)
table(banknote[,1],model@map)



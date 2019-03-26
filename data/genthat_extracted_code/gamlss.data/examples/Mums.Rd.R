library(gamlss.data)


### Name: Mums
### Title: Mothers encouragement data
### Aliases: Mums
### Keywords: datasets

### ** Examples

data(Mums)
MM<-xtabs(~mums+qual, data=Mums)
mosaicplot(MM, color=TRUE)
MM<-xtabs(~mums+ethn+gender, data=Mums)
mosaicplot(MM, color=TRUE)




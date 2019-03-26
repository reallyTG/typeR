library(opticut)


### Name: dolina
### Title: Land Snail Data Set
### Aliases: dolina
### Keywords: datasets

### ** Examples

data(dolina)
str(dolina)

## species richness by microhabitat and method
Richness <- rowSums(dolina$xtab > 0)
boxplot(Richness ~ mhab + method, dolina$samp,
    ylab="Species richness", main="Dolina data set",
    col=rep(c("#2C7BB6", "#D7191C"), each=4))




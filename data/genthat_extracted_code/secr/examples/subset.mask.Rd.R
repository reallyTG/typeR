library(secr)


### Name: subset.mask
### Title: Subset Mask Object
### Aliases: subset.mask rbind.mask
### Keywords: models

### ** Examples

tempmask <- make.mask(make.grid())
OK <- (tempmask$x + tempmask$y) > 100
tempmask <- subset(tempmask, subset = OK)
plot(tempmask)





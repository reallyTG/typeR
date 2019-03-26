library(MSnbase)


### Name: featureCV
### Title: Calculates coeffivient of variation for features
### Aliases: featureCV

### ** Examples

data(msnset)
msnset <- msnset[1:4]
gb <- factor(rep(1:2, each = 2))
featureCV(msnset, gb)
featureCV(msnset, gb, suffix = "2")




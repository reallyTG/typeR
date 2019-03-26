library(hcc)


### Name: rubber
### Title: Abrasion loss for various hardness and tensile strength
### Aliases: rubber
### Keywords: datasets

### ** Examples

data(rubber)
rmod <- lm(abrasion.loss~hardness+tensile.strength, data=rubber)
res <- resid(rmod)
hctest(rubber[,1], res)




library(bestglm)


### Name: rubber
### Title: Abrasion loss for various hardness and tensile strength
### Aliases: rubber
### Keywords: datasets

### ** Examples

data(rubber)
ans <- lm(abrasion.loss~hardness+tensile.strength, data=rubber)




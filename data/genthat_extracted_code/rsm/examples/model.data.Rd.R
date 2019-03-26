library(rsm)


### Name: model.data
### Title: Reconstruct data from a linear model
### Aliases: model.data
### Keywords: regression

### ** Examples

library(rsm)
trees.lm <- lm(log(Volume) ~ poly(log(Girth),3), data = trees, subset = 1:20)
model.frame(trees.lm)
model.data(trees.lm)




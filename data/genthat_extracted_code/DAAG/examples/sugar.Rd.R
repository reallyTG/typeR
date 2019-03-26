library(DAAG)


### Name: sugar
### Title: Sugar Data
### Aliases: sugar
### Keywords: datasets

### ** Examples

sugar.aov <- aov(weight ~ trt, data=sugar)
fitted.values(sugar.aov)
summary.lm(sugar.aov)
sugar.aov <- aov(formula = weight ~ trt, data = sugar)
summary.lm(sugar.aov)




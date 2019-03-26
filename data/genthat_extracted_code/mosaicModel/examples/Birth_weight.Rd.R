library(mosaicModel)


### Name: Birth_weight
### Title: Birth weights and maternal data
### Aliases: Birth_weight
### Keywords: datasets

### ** Examples

mod_1 <- lm(baby_wt ~ gestation + mother_wt, data = Birth_weight)
mod_effect(mod_1, ~ gestation)




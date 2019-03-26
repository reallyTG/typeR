library(mosaicModel)


### Name: AARP
### Title: Prices for life insurance
### Aliases: AARP
### Keywords: datasets

### ** Examples

mod_1 <- lm(Cost ~ Age + Coverage, data = AARP)
mod_effect(mod_1, ~ Coverage)




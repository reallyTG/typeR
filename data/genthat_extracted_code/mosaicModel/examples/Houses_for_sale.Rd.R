library(mosaicModel)


### Name: Houses_for_sale
### Title: Houses for sale
### Aliases: Houses_for_sale
### Keywords: datasets

### ** Examples

mod_1 <- lm(price ~ fireplaces, data = Houses_for_sale)
mod_2 <- lm(price ~ fireplaces + living_area, data = Houses_for_sale)
mod_effect(mod_1, ~ fireplaces)
mod_effect(mod_2, ~ fireplaces)
mod_plot(mod_2, ~ living_area + fireplaces)




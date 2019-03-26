library(mosaicModel)


### Name: Crime
### Title: Data from the US FBI Uniform Crime Report, 1960
### Aliases: Crime
### Keywords: datasets

### ** Examples

mod_1 <- lm(R ~ W, data = Crime)
mod_2 <- lm(R ~ X, data = Crime)
mod_3 <- lm(R ~ W + X, data = Crime)
mod_effect(mod_1, ~ W)
mod_effect(mod_3, ~ W)
mod_effect(mod_2, ~ X)
mod_effect(mod_3, ~ X)




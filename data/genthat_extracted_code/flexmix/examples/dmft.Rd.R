library(flexmix)


### Name: dmft
### Title: Dental Data
### Aliases: dmft
### Keywords: datasets

### ** Examples

data("dmft", package = "flexmix")
dmft_flx <- initFlexmix(End ~ 1, data = dmft, k = 2,
                        model = FLXMRglmfix(family = "poisson", 
                        fixed = ~ Gender + Ethnic + Treatment))




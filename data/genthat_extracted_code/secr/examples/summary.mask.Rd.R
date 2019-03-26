library(secr)


### Name: summary.mask
### Title: Summarise Habitat Mask
### Aliases: summary.mask print.summary.mask
### Keywords: models

### ** Examples

tempmask <- make.mask(make.grid())
## left to right gradient
covariates (tempmask) <- data.frame(x = tempmask$x)
summary(tempmask)




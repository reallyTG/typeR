library(drfit)


### Name: drfit
### Title: Fit dose-response models
### Aliases: drfit
### Keywords: models regression nonlinear

### ** Examples

data(antifoul)
r <- drfit(antifoul, showED50 = TRUE, EDx = c(5, 10, 20))
format(r, digits = 2)




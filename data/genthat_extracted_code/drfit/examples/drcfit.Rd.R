library(drfit)


### Name: drcfit
### Title: Fit dose-response models using the drc package
### Aliases: drcfit
### Keywords: models regression nonlinear

### ** Examples

data(antifoul)
r <- drcfit(antifoul, showED50 = TRUE, EDx = c(5, 10, 20))
format(r, digits = 2)




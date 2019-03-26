library(VGAM)


### Name: summarypvgam
### Title: Summarizing Penalized Vector Generalized Additive Model Fits
### Aliases: summarypvgam show.summary.pvgam
### Keywords: models regression

### ** Examples

hfit2 <- vgam(agaaus ~ sm.os(altitude), binomialff, data = hunua)
coef(hfit2, matrix = TRUE)
summary(hfit2)




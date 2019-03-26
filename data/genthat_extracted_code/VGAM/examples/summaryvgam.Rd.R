library(VGAM)


### Name: summaryvgam
### Title: Summarizing Vector Generalized Additive Model Fits
### Aliases: summaryvgam show.summary.vgam
### Keywords: models regression

### ** Examples

hfit <- vgam(agaaus ~ s(altitude, df = 2), binomialff, data = hunua)
summary(hfit)
summary(hfit)@anova  # Table for (approximate) testing of linearity




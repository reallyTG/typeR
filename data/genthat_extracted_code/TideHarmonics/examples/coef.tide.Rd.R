library(TideHarmonics)


### Name: coef.tide
### Title: Coefficients For Tidal Object
### Aliases: coef.tide
### Keywords: models

### ** Examples

hfit1 <- ftide(Hillarys$SeaLevel, Hillarys$DateTime, hc60)
hfit2 <- ftide(Hillarys$Sea, Hillarys$Date, hc7, smsl=TRUE)
coef(hfit1, hc = TRUE)
coef(hfit2)
coef(hfit2, mat = TRUE)
coef(hfit2, hc = TRUE)
coef(hfit2, hc = TRUE, mat = FALSE)




library(eba)


### Name: residuals.eba
### Title: Residuals for EBA Models
### Aliases: residuals.eba
### Keywords: models

### ** Examples

data(celebrities)                # absolute choice frequencies
btl1 <- eba(celebrities)         # fit Bradley-Terry-Luce model
sum( resid(btl1)^2 )             # deviance G2
deviance(btl1)
sum( resid(btl1, "pearson")^2 )  # Pearson X2




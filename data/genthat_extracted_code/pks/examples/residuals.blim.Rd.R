library(pks)


### Name: residuals.blim
### Title: Residuals for Basic Local Independence Models
### Aliases: residuals.blim
### Keywords: models

### ** Examples

data(DoignonFalmagne7)
blim1 <- blim(DoignonFalmagne7$K, DoignonFalmagne7$N.R)

sum( resid(blim1)^2 )                # likelihood ratio G2
sum( resid(blim1, "pearson")^2 )     # Pearson X2




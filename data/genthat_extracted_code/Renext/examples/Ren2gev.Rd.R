library(Renext)


### Name: Ren2gev
### Title: Translate a vector of coefficients from a Renewal-POT model with
###   Pareto excesses into a vector of GEV parameters
### Aliases: Ren2gev

### ** Examples

fit1 <- Renouv(Garonne, distname.y = "maxlo")
Ren2gev(fit1)
fit2 <- Renouv(Garonne, distname.y = "gpd")
Ren2gev(fit2)




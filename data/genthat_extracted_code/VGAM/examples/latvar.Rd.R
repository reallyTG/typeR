library(VGAM)


### Name: latvar
### Title: Latent Variables
### Aliases: lv latvar
### Keywords: models regression

### ** Examples

## Not run: 
##D hspider[, 1:6] <- scale(hspider[, 1:6])  # Standardized environmental vars
##D set.seed(123)
##D p1 <- cao(cbind(Pardlugu, Pardmont, Pardnigr, Pardpull, Zoraspin) ~
##D           WaterCon + BareSand + FallTwig + CoveMoss + CoveHerb + ReflLux,
##D           family = poissonff, data = hspider, Rank = 1, df1.nl =
##D           c(Zoraspin = 2.5, 3), Bestof = 3, Crow1positive = TRUE)
##D 
##D var(latvar(p1))  # Scaled to unit variance  # Scaled to unit variance
##D c(latvar(p1))    # Estimated site scores
## End(Not run)




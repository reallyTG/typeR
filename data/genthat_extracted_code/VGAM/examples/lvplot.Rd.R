library(VGAM)


### Name: lvplot
### Title: Latent Variable Plot
### Aliases: lvplot
### Keywords: models regression

### ** Examples

## Not run: 
##D hspider[,1:6] <- scale(hspider[,1:6])  # Standardized environmental vars
##D set.seed(123)
##D p1 <- cao(cbind(Pardlugu, Pardmont, Pardnigr, Pardpull, Zoraspin) ~
##D           WaterCon + BareSand + FallTwig +
##D           CoveMoss + CoveHerb + ReflLux,
##D           family = poissonff, data = hspider, Bestof = 3,
##D           df1.nl = c(Zoraspin = 2.5, 3), Crow1positive = TRUE)
##D index <- 1:ncol(depvar(p1))
##D lvplot(p1, lcol = index, pcol = index, y = TRUE, las = 1)
## End(Not run)




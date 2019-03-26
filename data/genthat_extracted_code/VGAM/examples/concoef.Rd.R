library(VGAM)


### Name: concoef
### Title: Extract Model Constrained/Canonical Coefficients
### Aliases: concoef
### Keywords: models regression

### ** Examples

## Not run: 
##D  set.seed(111)  # This leads to the global solution
##D hspider[,1:6] <- scale(hspider[,1:6])  # Standardized environmental vars
##D p1 <- cqo(cbind(Alopacce, Alopcune, Alopfabr, Arctlute, Arctperi,
##D                 Auloalbi, Pardlugu, Pardmont, Pardnigr, Pardpull,
##D                 Trocterr, Zoraspin) ~
##D           WaterCon + BareSand + FallTwig + CoveMoss + CoveHerb + ReflLux,
##D           family = poissonff, data = hspider, Crow1positive = FALSE)
##D concoef(p1)
## End(Not run)




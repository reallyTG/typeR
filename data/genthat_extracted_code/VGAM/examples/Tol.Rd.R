library(VGAM)


### Name: Tol
### Title: Tolerances
### Aliases: Tol
### Keywords: models regression

### ** Examples

## Not run: 
##D set.seed(111)  # This leads to the global solution
##D hspider[,1:6] <- scale(hspider[, 1:6])  # Standardized environmental vars
##D p1 <- cqo(cbind(Alopacce, Alopcune, Alopfabr, Arctlute, Arctperi,
##D                 Auloalbi, Pardlugu, Pardmont, Pardnigr, Pardpull,
##D                 Trocterr, Zoraspin) ~
##D           WaterCon + BareSand + FallTwig + CoveMoss + CoveHerb + ReflLux,
##D           poissonff, data = hspider, Crow1positive = FALSE)
##D 
##D Tol(p1)
## End(Not run)




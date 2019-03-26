library(VGAM)


### Name: Max
### Title: Maximums
### Aliases: Max
### Keywords: models regression

### ** Examples

## Not run: 
##D set.seed(111)  # This leads to the global solution
##D hspider[,1:6] <- scale(hspider[,1:6])  # Standardized environmental vars
##D p1 <- cqo(cbind(Alopacce, Alopcune, Alopfabr, Arctlute, Arctperi,
##D                 Auloalbi, Pardlugu, Pardmont, Pardnigr, Pardpull,
##D                 Trocterr, Zoraspin) ~
##D           WaterCon + BareSand + FallTwig + CoveMoss + CoveHerb + ReflLux,
##D           poissonff, Bestof = 2, data = hspider, Crow1positive = FALSE)
##D Max(p1)
##D 
##D index <- 1:ncol(depvar(p1))
##D persp(p1, col = index, las = 1, llwd = 2)
##D abline(h = Max(p1), lty = 2, col = index)
## End(Not run)




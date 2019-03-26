library(VGAM)


### Name: trplot
### Title: Trajectory Plot
### Aliases: trplot
### Keywords: models regression

### ** Examples

## Not run: 
##D  set.seed(123)
##D hspider[, 1:6] <- scale(hspider[, 1:6])  # Standardized environmental vars
##D p1cqo <- cqo(cbind(Alopacce, Alopcune, Alopfabr, Arctlute, Arctperi,
##D                   Auloalbi, Pardlugu, Pardmont, Pardnigr, Pardpull,
##D                   Trocterr, Zoraspin) ~
##D             WaterCon + BareSand + FallTwig + CoveMoss + CoveHerb + ReflLux,
##D             poissonff, data = hspider, Crow1positive = FALSE)
##D 
##D nos <- ncol(depvar(p1cqo))
##D clr <- 1:nos  # OR (1:(nos+1))[-7]  to omit yellow
##D 
##D trplot(p1cqo, which.species = 1:3, log = "xy",
##D        col = c("blue", "orange", "green"), lwd = 2, label = TRUE) -> ii
##D legend(0.00005, 0.3, paste(ii$species[, 1], ii$species[, 2], sep = " and "),
##D        lwd = 2, lty = 1, col = c("blue", "orange", "green"))
##D abline(a = 0, b = 1, lty = "dashed", col = "grey") 
## End(Not run)




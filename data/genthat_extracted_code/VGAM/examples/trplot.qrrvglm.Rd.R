library(VGAM)


### Name: trplot.qrrvglm
### Title: Trajectory plot for QRR-VGLMs
### Aliases: trplot.qrrvglm
### Keywords: models regression graphs

### ** Examples
## Not run: 
##D  set.seed(111)  # This leads to the global solution
##D # hspider[,1:6] <- scale(hspider[,1:6])  # Standardize the environmental variables
##D p1 <- cqo(cbind(Alopacce, Alopcune, Alopfabr, Arctlute, Arctperi, Auloalbi,
##D                 Pardlugu, Pardmont, Pardnigr, Pardpull, Trocterr, Zoraspin) ~
##D           WaterCon + BareSand + FallTwig + CoveMoss + CoveHerb + ReflLux,
##D           poissonff, data = hspider, trace = FALSE)
##D 
##D trplot(p1, which.species = 1:3, log = "xy", type = "b", lty = 1,
##D        main = "Trajectory plot of three hunting spiders species",
##D        col = c("blue","red","green"), lwd = 2, label = TRUE) -> ii
##D legend(0.00005, 0.3, lwd = 2, lty = 1, col = c("blue", "red", "green"),
##D        with(ii, paste(species.names[,1], species.names[,2], sep = " and ")))
##D abline(a = 0, b = 1, lty = "dashed", col = "grey")  # Useful reference line
## End(Not run)




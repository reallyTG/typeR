library(VGAM)


### Name: plotqrrvglm
### Title: Model Diagnostic Plots for QRR-VGLMs
### Aliases: plotqrrvglm
### Keywords: dplot models regression

### ** Examples
## Not run: 
##D # QRR-VGLM on the hunting spiders data
##D # This is computationally expensive
##D set.seed(111)  # This leads to the global solution
##D hspider[, 1:6] <- scale(hspider[, 1:6])  # Standardize environ vars
##D p1 <- cqo(cbind(Alopacce, Alopcune, Alopfabr, Arctlute, Arctperi,
##D                 Auloalbi, Pardlugu, Pardmont, Pardnigr, Pardpull,
##D                 Trocterr, Zoraspin) ~
##D           WaterCon + BareSand + FallTwig + CoveMoss + CoveHerb + ReflLux,
##D           poissonff, data = hspider, Crow1positive = FALSE)
##D par(mfrow = c(3, 4))
##D plot(p1, rtype = "response", col = "blue", pch = 4, las = 1, main = "")
## End(Not run)




library(VGAM)


### Name: qrrvglm.control
### Title: Control Function for QRR-VGLMs (CQO)
### Aliases: qrrvglm.control
### Keywords: models regression

### ** Examples

## Not run: 
##D  # Poisson CQO with equal tolerances
##D set.seed(111)  # This leads to the global solution
##D hspider[,1:6] <- scale(hspider[,1:6])  # Good idea when I.tolerances = TRUE
##D p1 <- cqo(cbind(Alopacce, Alopcune, Alopfabr, Arctlute, Arctperi, Auloalbi,
##D                Pardlugu, Pardmont, Pardnigr, Pardpull, Trocterr, Zoraspin) ~
##D           WaterCon + BareSand + FallTwig + CoveMoss + CoveHerb + ReflLux,
##D           poissonff, data = hspider, eq.tolerances = TRUE)
##D sort(deviance(p1, history = TRUE))  # A history of all the iterations
##D 
##D (isd.latvar <- apply(latvar(p1), 2, sd))  # Should be approx isd.latvar
##D 
##D # Refit the model with better initial values
##D set.seed(111)  # This leads to the global solution
##D p1 <- cqo(cbind(Alopacce, Alopcune, Alopfabr, Arctlute, Arctperi, Auloalbi,
##D                Pardlugu, Pardmont, Pardnigr, Pardpull, Trocterr, Zoraspin) ~
##D           WaterCon + BareSand + FallTwig + CoveMoss + CoveHerb + ReflLux,
##D           I.tolerances = TRUE, poissonff, data = hspider,
##D           isd.latvar = isd.latvar)  # Note the use of isd.latvar here
##D sort(deviance(p1, history = TRUE))  # A history of all the iterations
## End(Not run)




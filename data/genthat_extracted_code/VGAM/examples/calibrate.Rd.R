library(VGAM)


### Name: calibrate
### Title: Model Calibrations
### Aliases: calibrate
### Keywords: models regression

### ** Examples

## Not run: 
##D hspider[, 1:6] <- scale(hspider[, 1:6])  # Stdzed environmental vars
##D set.seed(123)
##D pcao1 <- cao(cbind(Pardlugu, Pardmont, Pardnigr, Pardpull, Zoraspin) ~
##D          WaterCon + BareSand + FallTwig + CoveMoss + CoveHerb + ReflLux,
##D          family = poissonff, data = hspider, Rank = 1, Bestof = 3,
##D          df1.nl = c(Zoraspin = 2, 1.9), Crow1positive = TRUE)
##D 
##D siteNos <- 1:2  # Calibrate these sites
##D cpcao1 <- calibrate(pcao1, trace = TRUE,
##D                     newdata = data.frame(depvar(pcao1)[siteNos, ],
##D                                          model.matrix(pcao1)[siteNos, ]))
##D 
##D # Graphically compare the actual site scores with their calibrated values
##D persp(pcao1, main = "Site scores: solid=actual, dashed=calibrated",
##D       label = TRUE, col = "blue", las = 1)
##D abline(v = latvar(pcao1)[siteNos], col = seq(siteNos))  # Actual scores
##D abline(v = cpcao1, lty = 2, col = seq(siteNos))  # Calibrated values
## End(Not run)




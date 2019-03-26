library(VGAM)


### Name: calibrate.qrrvglm.control
### Title: Control Function for CQO/CAO Calibration
### Aliases: calibrate.qrrvglm.control
### Keywords: models regression

### ** Examples

## Not run: 
##D  hspider[, 1:6] <- scale(hspider[, 1:6])  # Needed for I.tol=TRUE
##D set.seed(123)
##D p1 <- cqo(cbind(Alopacce, Alopcune, Pardlugu, Pardnigr,
##D                 Pardpull, Trocterr, Zoraspin) ~
##D           WaterCon + BareSand + FallTwig + CoveMoss + CoveHerb + ReflLux,
##D           family = poissonff, data = hspider, I.tol = TRUE)
##D sort(deviance(p1, history = TRUE))  # A history of all the iterations
##D siteNos <- 3:4  # Calibrate these sites
##D cp1 <- calibrate(p1, trace = TRUE,
##D                  new = data.frame(depvar(p1)[siteNos, ]))
## End(Not run)
## Not run: 
##D # Graphically compare the actual site scores with their calibrated values
##D persp(p1, main = "Site scores: solid=actual, dashed=calibrated",
##D       label = TRUE, col = "blue", las = 1)
##D abline(v = latvar(p1)[siteNos], col = seq(siteNos))  # Actual site scores
##D abline(v = cp1, lty = 2, col = seq(siteNos))  # Calibrated values
## End(Not run)




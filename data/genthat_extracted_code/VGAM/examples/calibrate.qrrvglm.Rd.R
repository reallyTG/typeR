library(VGAM)


### Name: calibrate.qrrvglm
### Title: Calibration for CQO and CAO models
### Aliases: calibrate.qrrvglm
### Keywords: models regression

### ** Examples

## Not run: 
##D hspider[, 1:6] <- scale(hspider[, 1:6])  # Stdze environmental variables
##D set.seed(123)
##D siteNos <- c(1, 5)  # Calibrate these sites
##D pet1 <- cqo(cbind(Pardlugu, Pardmont, Pardnigr, Pardpull, Zoraspin) ~
##D         WaterCon + BareSand + FallTwig + CoveMoss + CoveHerb + ReflLux,
##D         trace = FALSE,
##D         data = hspider[-siteNos, ],  # Sites not in fitted model
##D         family = poissonff, I.toler = TRUE, Crow1positive = TRUE)
##D y0 <- hspider[siteNos, colnames(depvar(pet1))]  # Species counts
##D (cpet1 <- calibrate(pet1, trace = TRUE, newdata = data.frame(y0)))
##D (clrpet1 <- calibrate(pet1, lr.confint = TRUE, newdata = data.frame(y0)))
##D (ccfpet1 <- calibrate(pet1, cf.confint = TRUE, newdata = data.frame(y0)))
##D (cp1wald <- calibrate(pet1, newdata = y0, type = "everything"))
## End(Not run)

## Not run: 
##D # Graphically compare the actual site scores with their calibrated
##D # values. 95 percent likelihood-based confidence intervals in green.
##D persp(pet1, main = "Site scores: solid=actual, dashed=calibrated",
##D       label = TRUE, col = "gray50", las = 1)
##D # Actual site scores:
##D xvars <- rownames(concoef(pet1))  # Variables comprising the latvar
##D est.latvar <- as.matrix(hspider[siteNos, xvars]) %*% concoef(pet1)
##D abline(v = est.latvar, col = seq(siteNos))
##D abline(v = cpet1, lty = 2, col = seq(siteNos))  # Calibrated values
##D arrows(clrpet1[,  3], c(60, 60), clrpet1[,  4], c(60, 60),  # Add CIs
##D        length = 0.08, col = "orange", angle = 90, code = 3, lwd = 2)
##D arrows(ccfpet1[,  3], c(70, 70), ccfpet1[,  4], c(70, 70),  # Add CIs
##D        length = 0.08, col = "limegreen", angle = 90, code = 3, lwd = 2)
##D arrows(cp1wald$latvar - 1.96 * sqrt(cp1wald$vcov), c(65, 65),
##D        cp1wald$latvar + 1.96 * sqrt(cp1wald$vcov), c(65, 65),  # Wald CIs
##D        length = 0.08, col = "blue", angle = 90, code = 3, lwd = 2)
##D legend("topright", lwd = 2,
##D        leg = c("CF interval", "Wald  interval", "LR interval"),
##D        col = c("limegreen", "blue", "orange"), lty = 1)
## End(Not run)




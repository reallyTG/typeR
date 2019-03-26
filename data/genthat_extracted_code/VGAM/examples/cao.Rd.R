library(VGAM)


### Name: cao
### Title: Fitting Constrained Additive Ordination (CAO)
### Aliases: cao
### Keywords: models regression

### ** Examples

## Not run: 
##D hspider[, 1:6] <- scale(hspider[, 1:6])  # Standardized environmental vars
##D set.seed(149)  # For reproducible results
##D ap1 <- cao(cbind(Pardlugu, Pardmont, Pardnigr, Pardpull) ~
##D            WaterCon + BareSand + FallTwig + CoveMoss + CoveHerb + ReflLux,
##D            family = poissonff, data = hspider, Rank = 1,
##D            df1.nl = c(Pardpull= 2.7, 2.5),
##D            Bestof = 7, Crow1positive = FALSE)
##D sort(deviance(ap1, history = TRUE))  # A history of all the iterations
##D 
##D Coef(ap1)
##D concoef(ap1)
##D 
##D par(mfrow = c(2, 2))
##D plot(ap1)  # All the curves are unimodal; some quite symmetric
##D 
##D par(mfrow = c(1, 1), las = 1)
##D index <- 1:ncol(depvar(ap1))
##D lvplot(ap1, lcol = index, pcol = index, y = TRUE)
##D 
##D trplot(ap1, label = TRUE, col = index)
##D abline(a = 0, b = 1, lty = 2)
##D 
##D trplot(ap1, label = TRUE, col = "blue", log = "xy", which.sp = c(1, 3))
##D abline(a = 0, b = 1, lty = 2)
##D 
##D persp(ap1, col = index, lwd = 2, label = TRUE)
##D abline(v = Opt(ap1), lty = 2, col = index)
##D abline(h = Max(ap1), lty = 2, col = index)
## End(Not run)




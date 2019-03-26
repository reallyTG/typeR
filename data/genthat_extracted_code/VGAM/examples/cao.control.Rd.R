library(VGAM)


### Name: cao.control
### Title: Control Function for RR-VGAMs (CAO)
### Aliases: cao.control
### Keywords: models regression

### ** Examples
## Not run: 
##D hspider[,1:6] <- scale(hspider[,1:6])  # Standardized environmental vars
##D set.seed(123)
##D ap1 <- cao(cbind(Pardlugu, Pardmont, Pardnigr, Pardpull, Zoraspin) ~
##D            WaterCon + BareSand + FallTwig +
##D            CoveMoss + CoveHerb + ReflLux,
##D            family = poissonff, data = hspider,
##D            df1.nl = c(Zoraspin = 2.3, 2.1),
##D            Bestof = 10, Crow1positive = FALSE)
##D sort(deviance(ap1, history = TRUE))  # A history of all the iterations
##D 
##D Coef(ap1)
##D 
##D par(mfrow = c(2, 3))  # All or most of the curves are unimodal; some are
##D plot(ap1, lcol = "blue")  # quite symmetric. Hence a CQO model should be ok
##D 
##D par(mfrow = c(1, 1), las = 1)
##D index <- 1:ncol(depvar(ap1))  # lvplot is jagged because only 28 sites
##D lvplot(ap1, lcol = index, pcol = index, y = TRUE)
##D 
##D trplot(ap1, label = TRUE, col = index)
##D abline(a = 0, b = 1, lty = 2)
##D 
##D persp(ap1, label = TRUE, col = 1:4)
## End(Not run)




library(VGAM)


### Name: perspqrrvglm
### Title: Perspective plot for QRR-VGLMs
### Aliases: perspqrrvglm
### Keywords: models regression graphs

### ** Examples
## Not run: 
##D hspider[, 1:6] <- scale(hspider[, 1:6])  # Good idea when I.tolerances = TRUE
##D set.seed(111)
##D r1 <- cqo(cbind(Alopacce, Alopcune, Alopfabr, Arctlute, Arctperi,
##D                 Auloalbi, Pardmont, Pardnigr, Pardpull, Trocterr) ~
##D           WaterCon + BareSand + FallTwig + CoveMoss + CoveHerb + ReflLux,
##D           poissonff, data = hspider, trace = FALSE, I.tolerances = TRUE)
##D set.seed(111)  # r2 below is an ill-conditioned model
##D r2 <- cqo(cbind(Alopacce, Alopcune, Alopfabr, Arctlute, Arctperi,
##D                 Auloalbi, Pardmont, Pardnigr, Pardpull, Trocterr) ~
##D           WaterCon + BareSand + FallTwig + CoveMoss + CoveHerb + ReflLux,
##D           isd.lv = c(2.4, 1.0), Muxfactor = 3.0, trace = FALSE,
##D           poissonff, data = hspider, Rank = 2, eq.tolerances = TRUE)
##D 
##D sort(deviance(r1, history = TRUE))  # A history of all the fits
##D sort(deviance(r2, history = TRUE))  # A history of all the fits
##D if (deviance(r2) > 857) stop("suboptimal fit obtained")
##D 
##D persp(r1, xlim = c(-6, 5), col = 1:4, label = TRUE)
##D 
##D # Involves all species
##D persp(r2, xlim = c(-6, 5), ylim = c(-4, 5), theta = 10, phi = 20, zlim = c(0, 220))
##D # Omit the two dominant species to see what is behind them
##D persp(r2, xlim = c(-6, 5), ylim = c(-4, 5), theta = 10, phi = 20, zlim = c(0, 220),
##D       which = (1:10)[-c(8, 10)])  # Use zlim to retain the original z-scale
## End(Not run)




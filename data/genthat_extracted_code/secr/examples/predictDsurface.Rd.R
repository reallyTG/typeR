library(secr)


### Name: predictDsurface
### Title: Predict Density Surface
### Aliases: predictDsurface
### Keywords: manip

### ** Examples


## use canned possum model
shorePossums <- predictDsurface(possum.model.Ds)
par(mar = c(1,1,1,6))
plot(shorePossums, plottype = "shaded", polycol = "blue", border = 100)
plot(traps(possumCH), detpar = list(col = "black"), add = TRUE)
par(mar = c(5,4,4,2) + 0.1)  ## reset to default
## extract and summarise
summary(covariates(shorePossums))

## Not run: 
##D 
##D ## extrapolate to a new mask; add covariate needed by model; plot
##D regionmask <- make.mask(traps(possumCH), buffer = 1000, spacing = 10,
##D     poly = possumremovalarea)
##D dts <- distancetotrap(regionmask, possumarea)
##D covariates(regionmask) <- data.frame(d.to.shore = dts)
##D regionPossums <- predictDsurface(possum.model.Ds, regionmask,
##D     se.D = TRUE, cl.D = TRUE)
##D par(mfrow = c(1,2), mar = c(1,1,1,6))
##D plot(regionPossums, plottype = "shaded", mesh = NA, breaks = 20)
##D plot(regionPossums, plottype = "contour", add = TRUE)
##D plot(regionPossums, covariate = "SE", plottype = "shaded",
##D     mesh = NA, breaks = 20)
##D plot(regionPossums, covariate = "SE", plottype = "contour",
##D     add = TRUE)
##D 
##D ## confidence surfaces
##D plot(regionPossums, covariate = "lcl", breaks = seq(0,3,0.2),
##D     plottype = "shaded")
##D plot(regionPossums, covariate = "lcl", plottype = "contour",
##D     add = TRUE, levels = seq(0,2.7,0.2))
##D title("lower 95% surface")
##D plot(regionPossums, covariate = "ucl", breaks=seq(0,3,0.2),
##D     plottype = "shaded")
##D plot(regionPossums, covariate = "ucl", plottype = "contour",
##D     add = TRUE, levels = seq(0,2.7,0.2))
##D title("upper 95% surface")
##D 
##D ## annotate with CI
##D par(mfrow = c(1,1))
##D plot(regionPossums, plottype = "shaded", mesh = NA, breaks = 20)
##D plot(traps(possumCH), add = TRUE, detpar = list(col = "black"))
##D spotHeight(regionPossums, dec = 1, pre = c("lcl","ucl"), cex = 0.8)
##D 
##D ## perspective plot
##D pm <- plot(regionPossums, plottype = "persp", box = FALSE, zlim =
##D     c(0,3), phi=30, d = 5, col = "green", shade = 0.75, border = NA)
##D lines(trans3d (possumremovalarea$x, possumremovalarea$y,
##D      rep(1,nrow(possumremovalarea)), pmat = pm))
##D 
##D par(mfrow = c(1,1), mar = c(5, 4, 4, 2) + 0.1)  ## reset to default
##D 
##D ## compare estimates of region N
##D ## grid cell area is 0.01 ha
##D sum(covariates(regionPossums)[,"D.0"]) * 0.01
##D region.N(possum.model.Ds, regionmask)
##D 
## End(Not run)





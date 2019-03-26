library(drc)


### Name: vinclozolin
### Title: Vinclozolin from AR in vitro assay
### Aliases: vinclozolin
### Keywords: datasets

### ** Examples



vinclozolin.m1 <- drm(effect~conc, exper, data=vinclozolin, fct = LL.3())
plot(vinclozolin.m1, xlim=c(0,50), ylim=c(0,2800), conLevel=1e-4)

vinclozolin.m2 <- drm(effect~conc, data=vinclozolin, fct = LL.3())
plot(vinclozolin.m2, xlim=c(0,50), conLevel=1e-4, add=TRUE, type="none", col="red")

## Are the ED50 values indetical across experiments?
vinclozolin.m3 <- update(vinclozolin.m1, pmodels=data.frame(exper, exper, 1))
anova(vinclozolin.m3, vinclozolin.m1)  # No!





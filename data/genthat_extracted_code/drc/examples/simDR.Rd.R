library(drc)


### Name: simDR
### Title: Simulating ED values under various scenarios
### Aliases: simDR
### Keywords: models nonlinear

### ** Examples


ryegrass.m1 <- drm(ryegrass, fct=LL.4())

simDR(coef(ryegrass.m1), sqrt(summary(ryegrass.m1)$resVar), LL.4(), 2, 
c(1.88, 3.75, 7.50, 0.94, 15, 0.47, 30, 0.23, 60), seedVal = 200710291)





library(drc)


### Name: P.promelas
### Title: Effect of sodium pentachlorophenate on growth of fathead minnow
### Aliases: P.promelas
### Keywords: datasets

### ** Examples


## Model with ED50 on log scale as parameter
p.prom.m1<-drm(dryweight~conc, data=P.promelas, fct=LN.3())

plot(fitted(p.prom.m1), residuals(p.prom.m1))

plot(p.prom.m1, type="all", broken=TRUE, xlim=c(0,1000))
summary(p.prom.m1)
ED(p.prom.m1, c(10,20,50), interval="delta")

## Model with ED50 as parameter
p.prom.m2<-drm(dryweight~conc, data=P.promelas, fct=LN.3(loge=TRUE))
summary(p.prom.m2)
ED(p.prom.m2, c(10,20,50), interval="fls")





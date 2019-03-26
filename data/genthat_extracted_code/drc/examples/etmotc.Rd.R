library(drc)


### Name: etmotc
### Title: Effect of erythromycin on mixed sewage microorganisms
### Aliases: etmotc
### Keywords: datasets

### ** Examples


etmotc.m1<-drm(rgr1~dose1, data=etmotc[1:15,], fct=LL.4())
plot(etmotc.m1)
modelFit(etmotc.m1)
summary(etmotc.m1)

etmotc.m2<-drm(rgr1~dose1, data=etmotc[1:15,], fct=W2.4())
plot(etmotc.m2, add = TRUE)
modelFit(etmotc.m2)
summary(etmotc.m2)

etmotc.m3<-drm(rgr1~dose1, data=etmotc[1:15,], fct=W2.3())
plot(etmotc.m3, add = TRUE)
modelFit(etmotc.m3)
summary(etmotc.m3)





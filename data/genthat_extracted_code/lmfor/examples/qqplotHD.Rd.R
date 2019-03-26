library(lmfor)


### Name: qqplotHD
### Title: Normal QQ-plot of a fitted H-D model
### Aliases: qqplotHD
### Keywords: forest biometrics graphs

### ** Examples

data(spati)

model<-fithd(spati$d,spati$h,spati$plot)

qqplotHD(model)




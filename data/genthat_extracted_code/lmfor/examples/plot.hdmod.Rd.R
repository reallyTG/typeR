library(lmfor)


### Name: plot.hdmod
### Title: Diagnostic plot a Height-Diameter model residuals
### Aliases: plot.hdmod
### Keywords: forest biometrics graphs

### ** Examples

data(spati)

model<-fithd(spati$d,spati$h,spati$plot)

plot(model)




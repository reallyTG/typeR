library(lmfor)


### Name: fithd
### Title: Fit a Height-Diameter model to forest tree data using functions
###   of package 'nlme'.
### Aliases: fithd
### Keywords: forest biometrics

### ** Examples

data(spati)

fithd(spati$d,spati$h,spati$plot)
fithd(spati$d,spati$h,spati$plot,SubModels=c("dmean","log(dmean)"),varf=2)




library(nlsMicrobio)


### Name: survivalcurve
### Title: Bacterial survival data sets
### Aliases: survivalcurve1 survivalcurve2 survivalcurve3
### Keywords: datasets

### ** Examples

data(survivalcurve1)
data(survivalcurve2)
data(survivalcurve3)
def.par <- par(no.readonly = TRUE)
par(mfrow=c(2,2))
plot(survivalcurve1, type="b")
plot(survivalcurve2, type="b")
plot(survivalcurve3, type="b")
par(def.par)




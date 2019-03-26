library(POCRE)


### Name: plot.pocre
### Title: Visualization of a 'pocre' Object
### Aliases: plot.pocre

### ** Examples

data(simdata)
xx <- scale(as.matrix(simdata[,-1]))
yy <- scale(as.matrix(simdata[,1]))

##Fit with pocre()
pres <- pocre(yy, xx, lambda=0.9)

# plot(pres,which=1)
plot(pres)




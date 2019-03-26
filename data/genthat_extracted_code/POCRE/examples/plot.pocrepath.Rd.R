library(POCRE)


### Name: plot.pocrepath
### Title: Visulaization of a POCRE Path
### Aliases: plot.pocrepath

### ** Examples

data(simdata)
xx <- scale(as.matrix(simdata[,-1]))
yy <- scale(as.matrix(simdata[,1]))

# ppres <- pocrepath(yy, xx, delta=0.01)
ppres <- pocrepath(yy, xx)

# plot(ppres)
plot(ppres,which=3)




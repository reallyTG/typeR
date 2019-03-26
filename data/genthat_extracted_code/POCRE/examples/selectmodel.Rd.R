library(POCRE)


### Name: selectmodel
### Title: Select the Optimal Model
### Aliases: selectmodel

### ** Examples

data(simdata)
xx <- scale(as.matrix(simdata[,-1]))
yy <- scale(as.matrix(simdata[,1]))

# ppres <- pocrepath(yy,xx,delta=0.01)
ppres <- pocrepath(yy,xx)
fres <- selectmodel(ppres)




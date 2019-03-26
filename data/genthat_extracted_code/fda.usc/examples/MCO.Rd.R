library(fda.usc)


### Name: MCO
### Title: Mithochondiral calcium overload (MCO) data set
### Aliases: MCO
### Keywords: datasets

### ** Examples

data(MCO)
names(MCO)
par(mfrow=c(1,2))
plot(MCO$intact,col=MCO$classintact)
plot(MCO$permea,col=MCO$classpermea)




library(gam)


### Name: gam.scope
### Title: Generate a scope for step.Gam
### Aliases: gam.scope
### Keywords: models regression nonparametric smooth

### ** Examples

data(gam.data)
gdata=gam.data[,1:3]
gam.scope(gdata,2)
gam.scope(gdata,2,arg="df=5")
gam.scope(gdata,2,arg="df=5",form=FALSE)
gam.scope(gdata,2,arg=c("df=4","df=6"))




library(magicaxis)


### Name: magaxis
### Title: Magically pretty axes
### Aliases: magaxis
### Keywords: axis plot log

### ** Examples

x=10^{1:9}
y=1:9
plot(log10(x),y,axes=FALSE)
magaxis(unlog='x')

plot(log10(x),y,axes=FALSE)
magaxis(side=c(1,3),unlog=c(TRUE,FALSE))

plot(x,y,axes=FALSE,log='x')
magaxis()





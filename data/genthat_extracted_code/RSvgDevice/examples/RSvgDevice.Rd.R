library(RSvgDevice)


### Name: devSVG
### Title: A SVG Graphics Driver
### Aliases: devSVG
### Keywords: device

### ** Examples

library(RSvgDevice)
devSVG()
plot(1:11,(-5:5)^2, type='b', main="Simple Example")
dev.off()




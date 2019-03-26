library(simsalapar)


### Name: device
### Title: Cropping and Font Embedding PDF Device
### Aliases: dev.off.pdf
### Keywords: utilities

### ** Examples

## typical usage
doPDF <- !dev.interactive(orNone=TRUE)
if(doPDF) pdf(file=(file <- "crop_device.pdf"), width=6, height=6)
plot(1)
if(doPDF) dev.off.pdf(file)




library(wmtsa)


### Name: make.signal
### Title: Test signal generation
### Aliases: make.signal
### Keywords: ts

### ** Examples

nms <- c("blocks", "linchirp", "mishmash1", "bumps")
z <- lapply(nms, make.signal)
ifultools::stackPlot(x=seq(1024),y=z, ylab=nms)




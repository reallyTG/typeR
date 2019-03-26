library(chipPCR)


### Name: C54
### Title: qPCR Experiment for the amplification of MLC-2v using the
###   VideoScan heating/cooling-unit
### Aliases: C54
### Keywords: VideoScan MLC-2v

### ** Examples

data(C54)
str(C54)
plot(NA, NA, xlim = c(0,56), ylim = c(0, 0.7), xlab = "Cycle", 
     ylab = "refMFI")
apply(C54[, c(2:4)], 2, function(x) lines(C54[, 1], x))




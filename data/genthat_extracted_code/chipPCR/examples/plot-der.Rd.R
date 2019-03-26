library(chipPCR)


### Name: plot.der
### Title: Plot 'der' objects
### Aliases: plot.der plot,der-method plot,der,ANY-method
### Keywords: hplot

### ** Examples


res <- inder(AmpSim(cyc = 1:40, Cq = 25))
plot(res)
#round the result of inder
plot(rounder(res))





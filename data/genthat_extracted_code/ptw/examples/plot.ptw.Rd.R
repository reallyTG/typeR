library(ptw)


### Name: plot.ptw
### Title: Plot a ptw object
### Aliases: plot.ptw
### Keywords: manip

### ** Examples

data(gaschrom)
ref <- gaschrom[1:8,]
samp <- gaschrom[9:16,]
gaschrom.ptw <- ptw(ref, samp, warp.type = "individual",
              optim.crit = "RMS", init.coef = c(0, 1, 0, 0))
plot(gaschrom.ptw)
plot(gaschrom.ptw, what = "function")




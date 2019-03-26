library(pointRes)


### Name: rgc.plot
### Title: Plot mean relative growth changes and pointer years
### Aliases: rgc.plot

### ** Examples

## Plot mean relative growth changes and pointer years
data(s033)
py <- pointer.rgc(s033, nb.yrs = 4, rgc.thresh.pos = 60, rgc.thresh.neg = 40, 
                  series.thresh = 75)
rgc.plot(py, start.yr = 1950, end.yr = NULL,  
         sd.disp = FALSE, x.tick.major = 10, x.tick.minor = 5)





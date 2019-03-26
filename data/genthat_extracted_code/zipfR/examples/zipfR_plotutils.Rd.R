library(zipfR)


### Name: zipfR.plotutils
### Title: Plotting Utilities (zipfR)
### Aliases: zipfR.plotutils zipfR.begin.plot zipfR.end.plot
###   zipfR.pick.device
### Keywords: device

### ** Examples


## these graphics parameters will be set for every new plot

## Not run: zipfR.par(init.par=list(bg="lightblue", cex=1.3))
## Not run: zipfR.par(width=12, height=9)

## will be shown on screen or saved to specified file, depending on
## selected device (eps -> "myplot.eps", pdf -> "myplot.pdf", etc.)

## Not run: zipfR.begin.plot(filename="myplot")
## Not run: plot.spc(Brown100k.spc)
## Not run: zipfR.end.plot()

## By starting an R script "myplots.R" with this command, you can
## display plots on screen when stepping through the script in an
## interactive session, or save them to disk files in various
## graphics formats with "R --no-save --args --pdf < myplots.R" etc.

## Not run: zipfR.pick.device()





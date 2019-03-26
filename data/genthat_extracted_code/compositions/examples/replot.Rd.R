library(compositions)


### Name: replot
### Title: Modify parameters of compositional plots.
### Aliases: replot replotable noreplot
### Keywords: aplot

### ** Examples

data(SimulatedAmounts)
plot(acomp(sa.lognormals5))
straight(acomp(c(1,1,1,1,1)),acomp(c(1,2,3,4,5)))
replot(onlyPanel=c(2,3))
oldPlot <- replot(plot=FALSE) # get the plotting call
replotable(plot(x=1:10)) # To make a graphic replottable
replot(col=1:10)
replot(plot=oldPlot)    # Restore the old plot (without plotting)
replot(onlyPanel=NULL)    # View the whole plot again
replot(pch=20)  # Acctually plot it 
replot(col=20)  # since the actual plot is gsi.pairs not a plot.acomp
 
## Not run: 
##D # The following line in  a plotting function stores the plot for replotting.
##D replot(plot=match.call()) # Store current call as plot 
##D replot()                  # simply plot once again
##D replot(dev=otherdev)      # redo a plot from an other device here.
##D replot(onlyPanel=c(3,4))  # modify the plot (and replot it)
##D replot(onlyPanel=c(3,4),dev=7,plot=FALSE) # modify a stored plot
## End(Not run)




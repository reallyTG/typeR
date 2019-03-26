library(dtw)


### Name: dtwPlot
### Title: Plotting of dynamic time warp results
### Aliases: dtwPlot dtwPlotAlignment dtwPlotDensity plot.dtw
### Keywords: ts hplot

### ** Examples

## Same example as in dtw

idx<-seq(0,6.28,len=100);
query<-sin(idx)+runif(100)/10;
reference<-cos(idx)

alignment<-dtw(query,reference,keep=TRUE);


## A profile of the cumulative distance matrix
## Contour plot of the global cost

dtwPlotDensity(alignment,
  main="Sine/cosine: symmetric  alignment, no constraints")



######
##
## A study of the "Itakura" parallelogram
##
## A widely held misconception is that the "Itakura parallelogram" (as
## described in the original article) is a global constraint.  Instead,
## it arises from local slope restrictions. Anyway, an "itakuraWindow",
## is provided in this package. A comparison between the two follows.


## The local constraint: three sides of the parallelogram are seen

dtw(query,reference,keep=TRUE,step=typeIIIc)->ita;
dtwPlot(ita,type="density",
        main="Slope-limited asymmetric step (Itakura)")

## Symmetric step with global parallelogram-shaped constraint. Note how
## long (>2 steps) horizontal stretches are allowed within the window.

dtw(query,reference,keep=TRUE,window=itakuraWindow)->ita;
dtwPlot(ita,type="density",
        main="Symmetric step with Itakura parallelogram window")






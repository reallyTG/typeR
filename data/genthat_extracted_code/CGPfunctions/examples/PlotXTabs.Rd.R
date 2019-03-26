library(CGPfunctions)


### Name: PlotXTabs
### Title: Plot a Cross Tabulation of two variables using dplyr and ggplot2
### Aliases: PlotXTabs

### ** Examples

PlotXTabs(mtcars, am, vs)
PlotXTabs(mtcars, am, vs, "stack")
PlotXTabs(mtcars, am, vs, "percent")
PlotXTabs(mtcars, am, 8, "side")
PlotXTabs(mtcars, 8, am, "stack")
PlotXTabs(mtcars, am, c(8,10), "percent")
PlotXTabs(mtcars, c(10,8), am)
PlotXTabs(mtcars, c(2,9), c(10,8), "mispelled")
## Not run: 
##D PlotXTabs(happy,happy,sex) # baseline
##D PlotXTabs(happy,2,5,"stack") # same thing using column numbers
##D PlotXTabs(happy, 2, c(5:9), plottype = "percent") # multiple columns RHS
##D PlotXTabs(happy, c(2,5), 9, plottype = "side") # multiple columns LHS
##D PlotXTabs(happy, c(2,5), c(6:9), plottype = "percent")
##D PlotXTabs(happy, happy, c(6,7,9), plottype = "percent")
##D PlotXTabs(happy, c(6,7,9), happy, plottype = "percent")
## End(Not run)





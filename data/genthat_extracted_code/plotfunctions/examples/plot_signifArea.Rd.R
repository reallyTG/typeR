library(plotfunctions)


### Name: plot_signifArea
### Title: Creates a colored surface plot from data frame input.
### Aliases: plot_signifArea

### ** Examples

# From the package graphics, see help(image):
x <- 10*(1:nrow(volcano))
y <- 10*(1:ncol(volcano))
tmp <- data.frame(value = (as.vector(volcano) - 120), 
    x = 10*rep(1:nrow(volcano), ncol(volcano)), 
    y = 10*rep(1:ncol(volcano), each=nrow(volcano)),
    CI = rep(20, nrow(volcano)*ncol(volcano)))
plotsurface(tmp, view=c('x', "y"), predictor='value', main="Maunga Whau Volcano")
plot_signifArea(tmp, view=c("x", "y"), predictor="value", valCI="CI")

# change color:
plotsurface(tmp, view=c('x', "y"), predictor='value', main="Maunga Whau Volcano")
plot_signifArea(tmp, view=c("x", "y"), predictor="value", valCI="CI", 
    col="red")
# or completely remove "nonsignificant" area:
plot_signifArea(tmp, view=c("x", "y"), predictor="value", valCI="CI", 
    col="white", alpha=1)





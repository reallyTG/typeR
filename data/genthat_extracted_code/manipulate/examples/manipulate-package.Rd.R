library(manipulate)


### Name: manipulate-package
### Title: Interactive Plots for RStudio
### Aliases: manipulate-package
### Keywords: package dynamic iplot

### ** Examples

## Not run: 
##D 
##D ## Create a plot with a manipulator
##D manipulate(plot(1:x), x = slider(5, 10))
##D 
##D ## Using more than one slider
##D manipulate(
##D   plot(cars, xlim=c(x.min,x.max)),
##D   x.min=slider(0,15),
##D   x.max=slider(15,30))
##D 
##D ## Filtering data with a picker
##D manipulate(
##D   barplot(as.matrix(longley[,factor]),
##D           beside = TRUE, main = factor),
##D   factor = picker("GNP", "Unemployed", "Employed"))
##D 
##D ## Create a picker with labels
##D manipulate(
##D   plot(pressure, type = type),
##D   type = picker("points" = "p", "line" = "l", "step" = "s"))
##D 
##D ## Toggle boxplot outlier display using checkbox
##D manipulate(
##D   boxplot(Freq ~ Class, data = Titanic, outline = outline),
##D   outline = checkbox(FALSE, "Show outliers"))
##D 
##D ## Combining controls
##D manipulate(
##D   plot(cars, xlim = c(x.min, x.max), type = type,
##D        axes = axes, ann = label),
##D   x.min = slider(0,15),
##D   x.max = slider(15,30, initial = 25),
##D   type = picker("p", "l", "b", "c", "o", "h", "s", "S", "n"),
##D   axes = checkbox(TRUE, "Draw Axes"),
##D   label = checkbox(FALSE, "Draw Labels"))
## End(Not run)




library(manipulate)


### Name: checkbox
### Title: Create a checkbox control
### Aliases: checkbox

### ** Examples

## Not run: 
##D 
##D ## Using checkboxes for boolean parameters
##D manipulate(
##D   plot(cars, axes = axes, ann = label),
##D   axes = checkbox(TRUE, "Draw Axes"),
##D   label = checkbox(FALSE, "Draw Labels"))
##D 
##D ## Toggle boxplot outlier display using checkbox
##D manipulate(
##D   boxplot(Freq ~ Class, data = Titanic, outline = outline),
##D   outline = checkbox(FALSE, "Show outliers"))
##D 
## End(Not run)




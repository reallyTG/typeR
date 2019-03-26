library(manipulate)


### Name: slider
### Title: Create a slider control
### Aliases: slider

### ** Examples

## Not run: 
##D 
##D ## Create a plot with a slider
##D manipulate(plot(1:x), x = slider(5, 10))
##D 
##D ## Use multiple sliders
##D manipulate(
##D   plot(cars, xlim = c(x.min, x.max)),
##D   x.min = slider(0,15),
##D   x.max = slider(15,30))
##D 
##D ## Specify a custom initial value for a slider
##D manipulate(
##D   barplot(1:x),
##D   x = slider(5, 25, initial = 10))
##D 
##D ## Specify a custom label for a slider
##D manipulate(
##D   barplot(1:x),
##D   x = slider(5, 25, label = "Limit"))
##D 
##D ## Specify a step value for a slider
##D manipulate(
##D   barplot(1:x),
##D   x = slider(5, 25, step = 5))
## End(Not run)




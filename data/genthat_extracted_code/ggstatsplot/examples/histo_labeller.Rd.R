library(ggstatsplot)


### Name: histo_labeller
### Title: Custom function for adding labelled lines for 'x'-axis variable.
### Aliases: histo_labeller
### Keywords: internal

### ** Examples

## Not run: 
##D library(ggplot2)
##D 
##D # creating a ploton which lines and labels are to be superposed
##D p <- ggplot(mtcars, aes(wt, mpg)) + geom_point()
##D 
##D # computing `y`-axis positions for line labels
##D y_label_pos <- median(
##D   x = ggplot2::layer_scales(p)$y$range$range,
##D   na.rm = TRUE
##D )
##D # adding labels
##D ggstatsplot:::histo_labeller(
##D   plot = p,
##D   x = mtcars$wt,
##D   y.label.position = y_label_pos,
##D   test.value.line = TRUE
##D )
## End(Not run)





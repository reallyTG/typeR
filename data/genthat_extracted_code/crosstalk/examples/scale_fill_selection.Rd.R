library(crosstalk)


### Name: scale_fill_selection
### Title: ggplot2 helpers
### Aliases: scale_color_selection scale_fill_selection selection_factor

### ** Examples

## Not run: 
##D sd <- SharedData$new(iris)
##D renderPlot({
##D   df <- sd$data(withSelection = TRUE, withFilter = TRUE)
##D   ggplot(df, aes(Sepal.Length, Sepal.Width,
##D     color = selection_factor(df))) +
##D     geom_point() +
##D     scale_color_selection("#444444", "skyblue1")
##D })
##D 
## End(Not run)




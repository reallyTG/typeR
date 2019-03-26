library(plotly)


### Name: ggplotly
### Title: Convert ggplot2 to plotly
### Aliases: ggplotly

### ** Examples

## Not run: 
##D # simple example
##D ggiris <- qplot(Petal.Width, Sepal.Length, data = iris, color = Species)
##D ggplotly(ggiris)
##D 
##D data(canada.cities, package = "maps")
##D viz <- ggplot(canada.cities, aes(long, lat)) +
##D   borders(regions = "canada") +
##D   coord_equal() +
##D   geom_point(aes(text = name, size = pop), colour = "red", alpha = 1/2)
##D ggplotly(viz, tooltip = c("text", "size"))
##D 
##D # linked scatterplot brushing
##D d <- highlight_key(mtcars)
##D qplot(data = d, x = mpg, y = wt) %>%
##D   subplot(qplot(data = d, x = mpg, y = vs)) %>% 
##D   layout(title = "Click and drag to select points") %>%
##D   highlight("plotly_selected")
##D 
##D 
##D # more brushing (i.e. highlighting) examples
##D demo("crosstalk-highlight-ggplotly", package = "plotly")
##D 
##D # client-side linked brushing in a scatterplot matrix
##D highlight_key(iris) %>%
##D   GGally::ggpairs(aes(colour = Species), columns = 1:4) %>%
##D   ggplotly(tooltip = c("x", "y", "colour")) %>%
##D   highlight("plotly_selected")
## End(Not run)





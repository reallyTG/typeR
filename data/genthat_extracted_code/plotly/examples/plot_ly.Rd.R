library(plotly)


### Name: plot_ly
### Title: Initiate a plotly visualization
### Aliases: plot_ly

### ** Examples

## Not run: 
##D 
##D # plot_ly() tries to create a sensible plot based on the information you 
##D # give it. If you don't provide a trace type, plot_ly() will infer one.
##D plot_ly(economics, x = ~pop)
##D plot_ly(economics, x = ~date, y = ~pop)
##D # plot_ly() doesn't require data frame(s), which allows one to take 
##D # advantage of trace type(s) designed specifically for numeric matrices
##D plot_ly(z = ~volcano)
##D plot_ly(z = ~volcano, type = "surface")
##D 
##D # plotly has a functional interface: every plotly function takes a plotly
##D # object as it's first input argument and returns a modified plotly object
##D add_lines(plot_ly(economics, x = ~date, y = ~unemploy/pop))
##D 
##D # To make code more readable, plotly imports the pipe operator from magrittr
##D economics %>% plot_ly(x = ~date, y = ~unemploy/pop) %>% add_lines()
##D 
##D # Attributes defined via plot_ly() set 'global' attributes that 
##D # are carried onto subsequent traces, but those may be over-written
##D plot_ly(economics, x = ~date, color = I("black")) %>%
##D  add_lines(y = ~uempmed) %>%
##D  add_lines(y = ~psavert, color = I("red"))
##D 
##D # Attributes are documented in the figure reference -> https://plot.ly/r/reference
##D # You might notice plot_ly() has named arguments that aren't in this figure
##D # reference. These arguments make it easier to map abstract data values to
##D # visual attributes.
##D p <- plot_ly(iris, x = ~Sepal.Width, y = ~Sepal.Length) 
##D add_markers(p, color = ~Petal.Length, size = ~Petal.Length)
##D add_markers(p, color = ~Species)
##D add_markers(p, color = ~Species, colors = "Set1")
##D add_markers(p, symbol = ~Species)
##D add_paths(p, linetype = ~Species)
##D 
## End(Not run)





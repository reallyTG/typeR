library(onemap)


### Name: plot.onemap
### Title: Draw a graphic of raw data for any OneMap population
### Aliases: plot.onemap

### ** Examples


## Not run: 
##D data(mapmaker_example_bc) # Loads a fake backcross dataset installed with onemap
##D plot(mapmaker_example_bc) # This will show you the graph
##D 
##D # You can store the graphic in an object, then save it with a number of properties
##D # For details, see the help of ggplot2's function ggsave()
##D g <- plot(mapmaker_example_bc)
##D ggplot2::ggsave("MyRawData_bc.jpg", g, width=7, height=4, dpi=600)
##D 
##D data(onemap_example_f2) # Loads a fake backcross dataset installed with onemap
##D plot(onemap_example_f2) # This will show you the graph
##D 
##D # You can store the graphic in an object, then save it with a number of properties
##D # For details, see the help of ggplot2's function ggsave()
##D g <- plot(onemap_example_f2)
##D ggplot2::ggsave("MyRawData_f2.jpg", g, width=7, height=4, dpi=600)
##D 
##D data(example_out) # Loads a fake full-sib dataset installed with onemap
##D plot(example_out) # This will show you the graph for all markers
##D plot(example_out, all=FALSE) # This will show you the graph splitted for marker types
##D 
##D # You can store the graphic in an object, then save it.
##D # For details, see the help of ggplot2's function ggsave()
##D g <- plot(example_out, all=FALSE)
##D ggplot2::ggsave("MyRawData_out.jpg", g, width=9, height=4, dpi=600)
## End(Not run)




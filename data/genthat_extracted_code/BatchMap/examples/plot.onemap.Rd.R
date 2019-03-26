library(BatchMap)


### Name: plot.onemap
### Title: Draw a graphic of raw data for any OneMap population
### Aliases: plot.onemap

### ** Examples

data(example.out) # Loads a fake full-sib dataset installed with onemap
plot(example.out) # This will show you the graph for all markers
plot(example.out, all=FALSE) # This will show you the graph splitted for marker types

# You can store the graphic in an object, then save it.
# For details, see the help of ggplot2's function ggsave()
g <- plot(example.out, all=FALSE)
ggsave("MyRawData_out.jpg", g, width=9, height=4, dpi=600)





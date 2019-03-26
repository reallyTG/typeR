library(onemap)


### Name: plot_by_segreg_type
### Title: Draw a graphic showing the number of markers of each segregation
###   pattern.
### Aliases: plot_by_segreg_type

### ** Examples

data(example_out) #Outcrossing data
plot_by_segreg_type(example_out)
plot_by_segreg_type(example_out, subcateg=FALSE)

data(mapmaker_example_bc)
plot_by_segreg_type(mapmaker_example_bc)

data(mapmaker_example_f2)
plot_by_segreg_type(mapmaker_example_f2)

# You can store the graphic in an object, then save it.
# For details, see the help of ggplot2's function ggsave()
# data(example_out) #Outcrossing data
# g <- plot_by_segreg_type(example_out)
# ggplot2::ggsave("SegregationTypes.jpg", g, width=7, height=4, dpi=600)





library(BatchMap)


### Name: plot.by.segreg.type
### Title: Draw a graphic showing the number of markers of each segregation
###   pattern.
### Aliases: plot.by.segreg.type

### ** Examples

data(example.out) #Outcrossing data
plot.by.segreg.type(example.out)
plot.by.segreg.type(example.out, subcateg=FALSE)

# You can store the graphic in an object, then save it.
# For details, see the help of ggplot2's function ggsave()
data(example.out) #Outcrossing data
g <- plot.by.segreg.type(example.out)
ggsave("SegregationTypes.jpg", g, width=7, height=4, dpi=600)





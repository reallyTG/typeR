library(rmonad)


### Name: plot.Rmonad
### Title: Render an Rmonad graph
### Aliases: plot.Rmonad

### ** Examples

data(gff)
# default plot
plot(gff$good_result)
# turn off vertex labels and set vertex size
plot(gff$good_result, vertex.size=10, vertex.label=NA)




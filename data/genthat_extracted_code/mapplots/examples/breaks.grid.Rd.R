library(mapplots)


### Name: breaks.grid
### Title: Define breakpoints for colour scales
### Aliases: breaks.grid

### ** Examples

breaks.grid(100,ncol=6)
breaks.grid(100,ncol=5,zero=FALSE)

# create breaks on the log scale
exp(breaks.grid(log(10000),ncol=4,zero=FALSE))




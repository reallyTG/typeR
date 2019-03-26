library(network)


### Name: as.color
### Title: Transform vector of values into color specification
### Aliases: as.color is.color

### ** Examples


as.color(1:3)
as.color(c('a','b','c'))

# add some transparency
as.color(c('red','green','blue'),0.5) # gives "#FF000080", "#00FF0080", "#0000FF80"

is.color(c('red',1,'foo',NA,'#FFFFFF55'))




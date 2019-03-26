library(cheddar)


### Name: CPS
### Title: Community properties
### Aliases: CPS
### Keywords: utilities

### ** Examples

data(TL84)

# All properties
CPS(TL84)

# Just lat and long
CPS(TL84, c('lat', 'long'))

# lat and long and number of nodes
CPS(TL84, c('lat', 'long', 'NumberOfNodes'))

# lat and long and number of nodes, renamed
CPS(TL84, c('lat', 'long', S='NumberOfNodes'))

# 'not a property' is NA
CPS(TL84, c('lat', 'long', S='NumberOfNodes', 'not a property'))




library(popsom)


### Name: map.neuron
### Title: Return a Map Neuron
### Aliases: map.neuron

### ** Examples

data(iris)

## set data frame and labels
df <- subset(iris,select=-Species)
labels <- subset(iris,select=Species)

## build a map
m <- map.build(df, labels, xdim=15, ydim=10, train=1000)

## display the neuron at position (1,1)
map.neuron(m,1,1)




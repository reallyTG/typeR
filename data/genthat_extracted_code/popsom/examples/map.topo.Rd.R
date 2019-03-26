library(popsom)


### Name: map.topo
### Title: Estimated Topographical Accuracy
### Aliases: map.topo

### ** Examples

data(iris)

## set data frame and labels
df <- subset(iris,select=-Species)
labels <- subset(iris,select=Species)

## build a map
m <- map.build(df, labels, xdim=15, ydim=10, train=1000)

## display estimated topographical accuracy of the map
map.topo(m)





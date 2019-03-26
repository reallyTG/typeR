library(popsom)


### Name: map.embed
### Title: Map Embedding Accuracy
### Aliases: map.embed

### ** Examples

data(iris)

## set data frame and labels
df <- subset(iris,select=-Species)
labels <- subset(iris,select=Species)

## build a map
m <- map.build(df, labels, xdim=15, ydim=10, train=1000)

## display the embedding accuracy of the map
map.embed(m)

## display the embedding accuracies of the individual features
data.frame(names(df),map.embed(m,verb=TRUE))




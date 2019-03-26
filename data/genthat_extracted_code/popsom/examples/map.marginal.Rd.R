library(popsom)


### Name: map.marginal
### Title: Plot Marginal Distribution
### Aliases: map.marginal

### ** Examples

data(iris)

## set data frame and labels
df <- subset(iris,select=-Species)
labels <- subset(iris,select=Species)

## build a map
m <- map.build(df, labels, xdim=15, ydim=10, train=1000)

## display marginal distribution of dimension 1
map.marginal(m,1)




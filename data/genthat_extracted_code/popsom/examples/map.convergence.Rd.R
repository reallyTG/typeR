library(popsom)


### Name: map.convergence
### Title: SOM Quality Assessment
### Aliases: map.convergence

### ** Examples

data(iris)

## set data frame and labels
df <- subset(iris,select=-Species)
labels <- subset(iris,select=Species)

## build a map
m <- map.build(df, labels, xdim=15, ydim=10, train=1000)

## map quality
map.convergence(m)





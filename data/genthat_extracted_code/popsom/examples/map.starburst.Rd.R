library(popsom)


### Name: map.starburst
### Title: Generate Starburst For Map
### Aliases: map.starburst

### ** Examples

data(iris)

## set data frame and labels
df <- subset(iris,select=-Species)
labels <- subset(iris,select=Species)

## build a map
m <- map.build(df, labels, xdim=15, ydim=10, train=1000)

## display the starburst for the map
map.starburst(m)




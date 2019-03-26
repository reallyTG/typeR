library(ggplot2)


### Name: layer
### Title: Create a new layer
### Aliases: layer
### Keywords: internal

### ** Examples

# geom calls are just a short cut for layer
ggplot(mpg, aes(displ, hwy)) + geom_point()
# shortcut for
ggplot(mpg, aes(displ, hwy)) +
  layer(geom = "point", stat = "identity", position = "identity",
    params = list(na.rm = FALSE)
  )

# use a function as data to plot a subset of global data
ggplot(mpg, aes(displ, hwy)) +
  layer(geom = "point", stat = "identity", position = "identity",
    data = head, params = list(na.rm = FALSE)
  )





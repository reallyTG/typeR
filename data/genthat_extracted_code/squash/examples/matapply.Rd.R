library(squash)


### Name: matapply
### Title: Apply a function over z coordinates, binned by their x, y
###   coordinates
### Aliases: matapply
### Keywords: misc

### ** Examples

  ## earthquake depths as a function of longitude, latitude
  attach(quakes)
  quakedepth <- matapply(depth ~ long + lat, FUN = mean)
  colorgram(quakedepth)

  ## iris petal length vs. sepal length and width
  ipl <- matapply(iris[,1:3], FUN = median, nx = 20, ny = 15 )
  colorgram(ipl, main = 'iris')
    
  ## Example of matrix input; here used to downsample an image 
  colorgram(volcano, colFn = terrain.colors)
  volcano2 <- matapply(volcano, FUN = mean, nx = 20)
  colorgram(volcano2, colFn = terrain.colors)
  




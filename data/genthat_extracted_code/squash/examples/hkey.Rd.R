library(squash)


### Name: hkey
### Title: Add a color key to a plot
### Aliases: hkey vkey
### Keywords: aplot color

### ** Examples
 

  attach(iris)
  map <- makecmap(Petal.Length)
  pl.color <- cmap(Petal.Length, map = map)

  plot(Sepal.Length, Sepal.Width, col = pl.color, pch = 16)
  hkey(map, title = 'Petal length (hkey default)')
  hkey(map, title = 'Another hkey', x = 3.8, y = 4.7, stretch = 3)

  ## looks bad with default margins
  vkey(map, title = 'vkey default')

  vkey(map, title = 'Small vkey', x = 7.8, y = 4, stretch = 0.3)





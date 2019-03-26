library(spatstat)


### Name: update.symbolmap
### Title: Update a Graphics Symbol Map.
### Aliases: update.symbolmap
### Keywords: spatial hplot

### ** Examples

  g <- symbolmap(size=function(x) x/50)
  g
  update(g, range=c(0,1))
  update(g, size=42)
  update(g, shape="squares", range=c(0,1))




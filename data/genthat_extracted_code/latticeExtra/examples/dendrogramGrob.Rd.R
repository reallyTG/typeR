library(latticeExtra)


### Name: dendrogramGrob
### Title: Create a Grob Representing a Dendrogram
### Aliases: dendrogramGrob
### Keywords: dplot

### ** Examples


data(mtcars)
x  <- t(as.matrix(scale(mtcars)))
dd.row <- as.dendrogram(hclust(dist(x)))
row.ord <- order.dendrogram(dd.row)

dd.col <- as.dendrogram(hclust(dist(t(x))))
col.ord <- order.dendrogram(dd.col)

library(lattice)

levelplot(x[row.ord, col.ord],
          aspect = "fill",
          scales = list(x = list(rot = 90)),
          colorkey = list(space = "left"),
          legend =
          list(right =
               list(fun = dendrogramGrob,
                    args =
                    list(x = dd.col, ord = col.ord,
                         side = "right",
                         size = 10)),
               top =
               list(fun = dendrogramGrob,
                    args =
                    list(x = dd.row, 
                         side = "top",
                         type = "triangle"))))


## Version with unsorted rows.

## For illustration, MPG ploted again at foot of dendrogram

mpg <- x["mpg", col.ord]
mpg.col <- level.colors(mpg, at = do.breaks(range(mpg), 10),
                        col.regions = terrain.colors)

levelplot(x[, col.ord],
          aspect = "iso",
          scales = list(x = list(rot = 90)),
          colorkey = FALSE,
          legend =
          list(right =
               list(fun = dendrogramGrob,
                    args =
                    list(x = dd.col, ord = col.ord,
                         side = "right",
                         add = list(rect = list(fill = mpg.col)),
                         size = 10)),
               top =
               list(fun = dendrogramGrob,
                    args =
                    list(x = dd.row, ord = sort(row.ord),
                         side = "top", size = 10,
                         type = "triangle"))))





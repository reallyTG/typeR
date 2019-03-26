library(squash)


### Name: colorgram
### Title: Draw a colorgram (heatmap) of a matrix
### Aliases: colorgram
### Keywords: hplot

### ** Examples


  ## median Petal.Length as function of Sepal.Length and Sepal.Width
  pl <- matapply( iris[,1:3], FUN = median, nx = 20, ny = 15 )

  ## Draw a colorgram with the default horizontal color key  
  colorgram(pl, main = 'iris')

  ## ... or with the vertical color key  
  colorgram(pl, main = 'iris', key = vkey)

  ## ... add margin space to improve legibility 
  op <- par(mar = c(5,4,4,4)+0.1)
  colorgram(pl, main = 'iris', key = vkey, 
    key.args = list(skip = 2), zlab = 'Petal\nlength')
  par(op)
  
  ##  Here is the example from the base function "persp"
  x <- seq(-10, 10, length= 30)
  y <- x
  f <- function(x,y) { r <- sqrt(x^2+y^2); 10 * sin(r)/(r) }
  z <- outer(x, y, f)
  colorgram(x, y, z)

  ## ... and with a slight fix to the key:
  colorgram(x, y, z, key.args = list(wh = c(1, 4, 14)))

  ## We could also make more space for the key:
  op <- par(mar = c(7,4,4,2)+0.1)
  colorgram(x, y, z, key.args = list(stretch = 3))
  par(op)
  
  ## Here are some alternatives to colorgram  
  persp(x, y, z, theta = 30, phi = 30, expand = 0.5, col = "lightblue")
  image(x, y, z)  
  contour(x, y, z)

  ## Use 'xlabels' and 'ylabels' to create categorical axes
  colorgram(t(mtcars[,c(2,8:11)]), colFn = heat, 
    xlabels = TRUE, ylabels = TRUE, 
    xlab = NA, ylab = NA, zlab = 'Value', 
    main = 'Motor car specifications', las = 1)
  




library(secrlinear)


### Name: linearmask.object
### Title: Description of Linear Mask Objects
### Aliases: linearmask
### Keywords: S3class

### ** Examples


## make a complex linear mask
x <- seq(0, 4*pi, length = 200)
xy <- data.frame(x = x*100, y = sin(x)*300)
xy2 <- data.frame(x = x*100, y = cos(x)*300)
test <- read.linearmask(data = xy, spacing = 10)
test2 <- read.linearmask(data = xy2, spacing = 10)
test3 <- rbind(test, test2)

## visualize the igraph network used by networkdistance()
tmp <- asgraph(test3)
if(require('igraph')) {
  i2 <- get.edges(tmp,1:ecount(tmp))
  plot(test3, linecol = 'white', col = 'grey')
  segments(test3[i2[,1],1], test3[i2[,1],2], test3[i2[,2],1],
      test3[i2[,2],2], lwd=2, col='blue')
}




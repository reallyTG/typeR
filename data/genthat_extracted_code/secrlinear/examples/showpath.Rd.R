library(secrlinear)


### Name: showpath
### Title: Display Shortest Path
### Aliases: showpath
### Keywords: manip

### ** Examples


## Not run: 
##D 
##D x <- seq(0, 4*pi, length = 200)
##D xy <- data.frame(x = x*100, y = sin(x)*300)
##D xy2 <- data.frame(x = x*100, y = cos(x)*300)
##D test <- read.linearmask(data = xy, spacing = 10)
##D test2 <- read.linearmask(data = xy2, spacing = 10)
##D test3 <- rbind(test, test2)
##D showpath(test3, lwd = 5)
##D 
## End(Not run)





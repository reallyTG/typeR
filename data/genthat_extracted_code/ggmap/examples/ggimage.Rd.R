library(ggmap)


### Name: ggimage
### Title: Plot an image using ggplot2
### Aliases: ggimage

### ** Examples


img <- matrix(1:16, 4, 4)
image(img)
ggimage(t(img[,4:1]), fullpage = FALSE, scale_axes = TRUE)
ggimage(t(img[,4:1]), fullpage = FALSE)


## Not run: 
##D # not run due to slow performance
##D 
##D data(hadley)
##D ggimage(hadley)
##D ggimage(hadley, coord_equal = FALSE)
##D 
##D x <- seq(1, 438, 15); n <- length(x)
##D df <- data.frame(x = x, y = -(120*(scale((x - 219)^3 - 25000*x) + rnorm(n)/2 - 3)))
##D qplot(x, y, data = df, geom = c('smooth','point'))
##D ggimage(hadley, fullpage = FALSE) +
##D   geom_smooth(aes(x = x, y = y), fill = I('gray60'), data = df,
##D     colour = I('green'), size = I(1)) +
##D   geom_point(aes(x = x, y = y), data = df,
##D     colour = I('green'), size = I(3), fill = NA)
##D 
## End(Not run)




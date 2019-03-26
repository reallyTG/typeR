library(ggforce)


### Name: theme_no_axes
### Title: Theme without axes and gridlines
### Aliases: theme_no_axes

### ** Examples

p <- ggplot() + geom_point(aes(x = wt, y = qsec), data = mtcars)

p + theme_no_axes()
p + theme_no_axes(theme_grey())





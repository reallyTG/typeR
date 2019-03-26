library(ggmap)


### Name: gglocator
### Title: Locator for ggplots.
### Aliases: gglocator

### ** Examples


if(interactive()){

# only run for interactive sessions


df <- expand.grid(x = 0:-5, y = 0:-5)
(p <- qplot(x, y, data = df) +
  annotate(geom = 'point', x = -2, y = -2, colour = 'red'))
gglocator()

p +
  scale_x_continuous(expand = c(0,0)) +
  scale_y_continuous(expand = c(0,0))
gglocator(1, xexpand = c(0,0), yexpand = c(0,0))


}






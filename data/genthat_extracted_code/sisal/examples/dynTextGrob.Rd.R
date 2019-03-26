library(sisal)


### Name: dynTextGrob
### Title: Create Text with Changing Size
### Aliases: dynTextGrob
### Keywords: dplot

### ** Examples

library(grid)
grid.newpage()
grid.draw(dynTextGrob("Hello", vjust = 0, y = 0))
grid.draw(dynTextGrob(list(expression(y==x^2),
                           "Hello,\ntry resizing me!"),
                      x = rep(1, 2), y = 1, rot = -45,
                      hjust = 1, vjust = 1,
                      rotHjust = c(0, 1), rotVjust = 1))




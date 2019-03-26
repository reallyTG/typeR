library(lemon)


### Name: gtable_show_grill
### Title: Visualise underlying gtable layout.
### Aliases: gtable_show_grill gtable_show_names

### ** Examples

library(ggplot2)
library(gtable)
library(grid)

p <- ggplot(mtcars, aes(wt, mpg)) + geom_point()

gtable_show_grill(p)
library(ggplot2)
library(gtable)
library(grid)

p <- ggplot(mtcars, aes(wt, mpg)) + geom_point()

gtable_show_names(p)




library(plyr)


### Name: splitter_d
### Title: Split a data frame by variables.
### Aliases: splitter_d
### Keywords: internal

### ** Examples

plyr:::splitter_d(mtcars, .(cyl))
plyr:::splitter_d(mtcars, .(vs, am))
plyr:::splitter_d(mtcars, .(am, vs))

mtcars$cyl2 <- factor(mtcars$cyl, levels = c(2, 4, 6, 8, 10))
plyr:::splitter_d(mtcars, .(cyl2), drop = TRUE)
plyr:::splitter_d(mtcars, .(cyl2), drop = FALSE)

mtcars$cyl3 <- ifelse(mtcars$vs == 1, NA, mtcars$cyl)
plyr:::splitter_d(mtcars, .(cyl3))
plyr:::splitter_d(mtcars, .(cyl3, vs))
plyr:::splitter_d(mtcars, .(cyl3, vs), drop = FALSE)




library(ggloop)


### Name: %L+%
### Title: Add components to a ggloop object.
### Aliases: %L+%

### ** Examples

# Add component to entire list.
g <- ggloop(mtcars, aes_loop(x = mpg:hp, y = mpg:hp))
g <- g %L+% ggplot2::geom_point()

# Add component to a subset of a list
g2 <- ggloop(mtcars, aes_loop(x = disp:wt, y = disp:wt, color = c(cyl, gear)))
g2$color.gear <- g2$color.gear %L+% ggplot2::geom_point()
g2$color.cyl[1:3] <- g2$color.cyl[1:3] %L+% ggplot2::geom_point()
g2$color.cyl$x.hp_y.drat <- g2$color.cyl$x.hp_y.drat %L+% ggplot2::geom_point()




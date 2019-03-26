library(ggplot2)


### Name: update_labels
### Title: Update axis/legend labels
### Aliases: update_labels
### Keywords: internal

### ** Examples

p <- ggplot(mtcars, aes(mpg, wt)) + geom_point()
update_labels(p, list(x = "New x"))
update_labels(p, list(x = expression(x / y ^ 2)))
update_labels(p, list(x = "New x", y = "New Y"))
update_labels(p, list(colour = "Fail silently"))




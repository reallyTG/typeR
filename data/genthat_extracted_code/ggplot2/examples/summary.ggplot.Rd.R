library(ggplot2)


### Name: summary.ggplot
### Title: Displays a useful description of a ggplot object
### Aliases: summary.ggplot
### Keywords: internal

### ** Examples

p <- ggplot(mtcars, aes(mpg, wt)) +
  geom_point()
summary(p)




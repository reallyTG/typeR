library(egg)


### Name: set_panel_size
### Title: set_panel_size
### Aliases: set_panel_size

### ** Examples

p1 <- qplot(mpg, wt, data=mtcars, colour=cyl)
p2 <- p1 + facet_wrap(~carb, nrow=1)
grid.arrange(grobs=lapply(list(p1,p2), set_panel_size))




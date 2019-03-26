library(latticeExtra)


### Name: custom.theme
### Title: Create a lattice theme based on specified colors
### Aliases: custom.theme custom.theme.2
### Keywords: dplot

### ** Examples

set.seed(0)

## create a plot to demonstrate graphical settings
obj <-
xyplot(Sepal.Length + Sepal.Width ~ Petal.Length + Petal.Width, iris,
       type = c("p", "r"), jitter.x = TRUE, jitter.y = TRUE, factor = 5,
       auto.key = list(lines = TRUE, rectangles = TRUE))
obj <- update(obj, legend = list(right =
         list(fun = "draw.colorkey", args = list(list(at = 0:100)))))

## draw with default theme
obj

## draw with custom.theme()
update(obj, par.settings = custom.theme())

## create a theme with paired colours, filled points, etc
update(obj, par.settings =
  custom.theme(symbol = brewer.pal(12, "Paired"),
               fill = brewer.pal(12, "Paired"),
               region = brewer.pal(9, "Blues"),
               bg = "grey90", fg = "grey20", pch = 16))

## draw with custom.theme.2()
update(obj, par.settings = custom.theme.2())




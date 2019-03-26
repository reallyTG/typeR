library(easySVG)


### Name: polygon.svg
### Title: Generate polygon SVG element
### Aliases: polygon.svg

### ** Examples

points <- matrix(c(1,2,3, 11,12,13), nrow = 3, ncol = 2)
polygon.svg(points = points)
polygon.svg(points = points, fill = "red", stroke = "yellow", fill.rule = "evenodd")






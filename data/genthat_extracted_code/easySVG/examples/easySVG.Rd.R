library(easySVG)


### Name: easySVG
### Title: easySVG package can generate SVG elements easily
### Aliases: easySVG easySVG-package

### ** Examples


line <- line.svg(x1 = 50, y1 = 20, x2 = 150, y2 = 20)
rect <- rect.svg(x = 50, y = 60, width = 100, height = 10, fill = "blue")
circle <- circle.svg(cx = 80, cy = 100, r = 10, fill = "blue")
ellipse <- ellipse.svg(cx = 100, cy = 120, rx = 20, ry = 5, fill = "blue")

points <- matrix(c( 50, 100, 120, 140, 135, 145), nrow = 3, ncol = 2)
polygon <- polygon.svg(points = points, fill = "green", stroke = "none")
polyline <- polyline.svg(points = points)
text <- get.text.svg(x = 10, y = 20, text.content = "This is a text element", font.size = 6)

group.content <- list(line, rect,
                      circle, ellipse,
                      polygon, polyline,
                      text)
group <- group.svg(id = "group_1", group.content = group.content)

## Not run: 
##D svg.name <- paste0(tempfile(),".svg")
##D pack.svg(pack.content = group, output.svg.name = svg.name)
## End(Not run)





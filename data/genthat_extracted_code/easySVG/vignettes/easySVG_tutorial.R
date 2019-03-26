## ----setup, include=FALSE------------------------------------------------
knitr::opts_chunk$set(comment = "#>", collapse = TRUE)

## ------------------------------------------------------------------------
library(easySVG)

line.1 <- line.svg(x1 = 50, y1 = 20, x2 = 150, y2 = 20)
message(line.1)

line.2 <- line.svg(x1 = 50, y1 = 40, x2 = 150, y2 = 40, stroke = "red", stroke.width = 3)
message(line.2)

## ------------------------------------------------------------------------
rect.1 <- rect.svg(x = 50, y = 60, width = 100, height = 10, fill = "blue")
message(rect.1)

rect.2 <- rect.svg(x = 50, y = 80, width = 100, height = 5, fill = "yellow", stroke = "none")
message(rect.2)

## ------------------------------------------------------------------------
circle.1 <- circle.svg(cx = 80, cy = 100, r = 10, fill = "blue")
message(circle.1)

circle.2 <- circle.svg(cx = 120, cy = 100, r = 5, fill = "red", stroke = "none")
message(circle.2)

## ------------------------------------------------------------------------
ellipse.1 <- ellipse.svg(cx = 100, cy = 120, rx = 20, ry = 5, fill = "blue")
message(ellipse.1)

## ------------------------------------------------------------------------
points <- matrix(c( 50, 100, 120, 140, 135, 145), nrow = 3, ncol = 2)

polygon.1 <- polygon.svg(points = points, fill = "green", stroke = "none")
message(polygon.1)

## ------------------------------------------------------------------------
points <- matrix(c( 50, 100, 120, 160, 155, 165), nrow = 3, ncol = 2)

polyline.1 <- polyline.svg(points = points)
message(polyline.1)

## ------------------------------------------------------------------------
text <- c("line.1", "line.2", "rect.1","rect.2",
          "circle.1 - circle.2", "ellipse.1",
          "polygon.1", "polyline.1")

text.elements <- lapply(1:length(text), 
                        function(x) get.text.svg(x = 10, y = 20*x, text.content = text[x], font.size = 6))

text.elements <- unlist(text.elements)

## ------------------------------------------------------------------------
content <- list(line.1, line.2, rect.1, rect.2,
                circle.1, circle.2, ellipse.1,
                polygon.1, polyline.1, text.elements)
svg.name <- paste0(tempfile(),".svg")
pack.svg(width = 200, height = 200, pack.content = unlist(content), output.svg.name = svg.name)


library(DiceView)


### Name: contourview.list
### Title: Plot a contour view of a model, including design points
### Aliases: contourview.list
### Keywords: models

### ** Examples

## A 2D example - Branin-Hoo function
## a 16-points factorial design, and the corresponding response
d <- 2; n <- 16
design.fact <- expand.grid(seq(0, 1, length = 4), seq(0, 1, length = 4))
design.fact <- data.frame(design.fact); names(design.fact) <-c("x1", "x2")
y <- branin(design.fact)

## linear model
m1 <- modelFit(design.fact, y[[1]], type = "Linear", formula = "Y~.")

## the same as sectionview3d.list
contourview(m1)




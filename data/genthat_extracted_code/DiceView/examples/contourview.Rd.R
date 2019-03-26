library(DiceView)


### Name: contourview
### Title: Plot a contour view of a kriging or modelPredict model including
###   design points, or a function.
### Aliases: contourview contourview,km-method contourview,list-method
###   contourview,function-method
### Keywords: models

### ** Examples

## A 2D example - Branin-Hoo function
## a 16-points factorial design, and the corresponding response
d <- 2; n <- 16
design.fact <- expand.grid(seq(0, 1, length = 4), seq(0, 1, length = 4))
design.fact <- data.frame(design.fact); names(design.fact) <- c("x1", "x2")
y <- branin(design.fact) 

## kriging model 1 : matern5_2 covariance structure, no trend, no nugget effect
m1 <- km(design = design.fact, response = y)

contourview(m1)

contourview(branin, dim = 2, add=TRUE)





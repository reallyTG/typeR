library(DiceView)


### Name: view
### Title: Plot a view of a kriging, modelPredict model or function.
### Aliases: view view,character,km-method view,character,list-method
###   view,character,function-method
### Keywords: models

### ** Examples

## A 2D example - Branin-Hoo function. See DiceKriging package manual 
## a 16-points factorial design, and the corresponding response
d <- 2; n <- 16
design.fact <- expand.grid(seq(0, 1, length = 4), seq(0, 1, length = 4))
design.fact <- data.frame(design.fact); names(design.fact)<-c("x1", "x2")
y <- branin(design.fact) 

## kriging model 1 : matern5_2 covariance structure, no trend, no nugget effect

m1 <- km(design = design.fact, response = y)

## the same as sectionview3d
view("3d",m1)
view("3d",branin, dim = 2, col='red', add = TRUE)





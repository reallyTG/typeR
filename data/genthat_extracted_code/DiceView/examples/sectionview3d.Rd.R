library(DiceView)


### Name: sectionview3d
### Title: Plot a 3-D (using RGL) view of a kriging or modelPredict model,
###   including design points
### Aliases: sectionview3d sectionview3d,km-method
###   sectionview3d,list-method sectionview3d,function-method
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

## the same as sectionview3d.km
sectionview3d(m1)

sectionview3d(branin, dim = 2, add = TRUE)





library(DiceView)


### Name: sectionview
### Title: Plot a section view of a kriging or modelPredict model including
###   design points, or a function.
### Aliases: sectionview sectionview,km-method sectionview,list-method
###   sectionview,function-method

### ** Examples

## A 2D example - Branin-Hoo function
## a 16-points factorial design, and the corresponding response
d <- 2; n <- 16
design.fact <- expand.grid(seq(0, 1, length = 4), seq(0, 1, length = 4))
design.fact <- data.frame(design.fact); names(design.fact) <- c("x1", "x2")
y <- branin(design.fact) 

## kriging model 1 : matern5_2 covariance structure, no trend, no nugget effect
m1 <- km(design = design.fact, response = y)

sectionview(m1, center = c(.333, .333))

sectionview(branin, dim = 2, center = c(.333, .333), add = TRUE)





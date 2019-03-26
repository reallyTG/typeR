library(HoRM)


### Name: ppr_funs
### Title: Ridge Functions for Projection Pursuit Regression
### Aliases: ppr_funs
### Keywords: file

### ** Examples
 
## Projection pursuit regression on the rock dataset.

data(rock)

ppr.out <- ppr(log(perm) ~ area + peri + shape,
               data = rock, nterms = 2, max.terms = 5)
obj <- ppr_funs(ppr.out)

obj





library(ICAOD)


### Name: sensrobust
### Title: Verifying Optimality of The Robust Designs
### Aliases: sensrobust

### ** Examples

# Verifying a robust design for the two-parameter logistic model
sensrobust(formula = ~1/(1 + exp(-b *(x - a))),
           predvars = c("x"),
           parvars = c("a", "b"),
           family = binomial(),
           prob = rep(1/4, 4),
           parset = matrix(c(0.5, 1.5, 0.5, 1.5, 4.0, 4.0, 5.0, 5.0), 4, 2),
           x = c(0.260, 1, 1.739), w = c(0.275, 0.449, 0.275),
           lx = -5, ux = 5)






library(DAMisc)


### Name: DAintfun2
### Title: Conditional Effects Plots for Interactions in Linear Models
### Aliases: DAintfun2

### ** Examples

data(InteractionEx)
mod <- lm(y ~ x1*x2 + z, data=InteractionEx)
DAintfun2(mod, c("x1", "x2"), hist=TRUE, scale.hist=.3)




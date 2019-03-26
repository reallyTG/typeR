library(margins)


### Name: marginal_effects
### Title: Differentiate a Model Object with Respect to All (or Specified)
###   Variables
### Aliases: marginal_effects marginal_effects.margins
###   marginal_effects.default marginal_effects.glm marginal_effects.lm
###   marginal_effects.loess marginal_effects.merMod
###   marginal_effects.lmerMod marginal_effects.nnet marginal_effects.polr
### Keywords: models

### ** Examples

require("datasets")
x <- lm(mpg ~ cyl * hp + wt, data = mtcars)
marginal_effects(x)

# factor variables report discrete differences
x <- lm(mpg ~ factor(cyl) * factor(am), data = mtcars)
marginal_effects(x)

# get just marginal effects from "margins" object
require('datasets')
m <- margins(lm(mpg ~ hp, data = mtcars[1:10,]))
marginal_effects(m)
marginal_effects(m)

# multi-category outcome
if (requireNamespace("nnet")) {
  data("iris3", package = "datasets")
  ird <- data.frame(rbind(iris3[,,1], iris3[,,2], iris3[,,3]),
                    species = factor(c(rep("s",50), rep("c", 50), rep("v", 50))))
  m <- nnet::nnet(species ~ ., data = ird, size = 2, rang = 0.1,
                  decay = 5e-4, maxit = 200, trace = FALSE)
  marginal_effects(m) # default
  marginal_effects(m, category = "v") # explicit category
}





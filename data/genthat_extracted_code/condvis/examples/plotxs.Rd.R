library(condvis)


### Name: plotxs
### Title: Visualise a section in data space
### Aliases: plotxs

### ** Examples

data(mtcars)
model <- lm(mpg ~ ., data = mtcars)
plotxs(xs = mtcars[, "wt", drop = FALSE], y = mtcars[, "mpg", drop = FALSE],
  xc.cond = mtcars[1, ], model = list(model))





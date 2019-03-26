library(GGally)


### Name: broomify
### Title: Broomify a model
### Aliases: broomify

### ** Examples

data(mtcars)
model <- stats::lm(mpg ~ wt + qsec + am, data = mtcars)
broomified_model <- broomify(model)
str(broomified_model)




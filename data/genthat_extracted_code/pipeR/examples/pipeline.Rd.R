library(pipeR)


### Name: pipeline
### Title: Evaluate an expression pipeline
### Aliases: pipeline

### ** Examples

pipeline(1:10, sin, sum)

pipeline(1:10, plot(col = "red", type = "l"))

pipeline(mtcars,
  lm(formula = mpg ~ cyl + wt),
  summary,
  coef)

pipeline({
  mtcars
  lm(formula = mpg ~ cyl + wt)
  summary
  coef
})

pipeline({
  mtcars
  "Sample data" ? head(., 3)
  lm(formula = mpg ~ cyl + wt)
  ~ lmodel
  summary
  ? .$r.squared
  coef
})

pipeline({
 mtcars
 "estimating a linear model ..."
 lm(formula = mpg ~ cyl + wt)
 "summarizing the model ..."
 summary
})




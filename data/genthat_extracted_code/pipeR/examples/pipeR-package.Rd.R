library(pipeR)


### Name: pipeR-package
### Title: The pipeR package
### Aliases: pipeR-package

### ** Examples

# Traditional code:
plot(density(sample(mtcars$mpg, size = 10000, replace = TRUE),
 kernel = "gaussian"), col = "red", main="density of mpg (bootstrap)")

# Operator-based pipeline using %>>%:
mtcars$mpg %>>%
  sample(size = 10000, replace = TRUE) %>>%
  density(kernel = "gaussian") %>>%
  plot(col = "red", main = "density of mpg (bootstrap)")

# Object-based pipeline using Pipe():
Pipe(mtcars$mpg)$
  sample(size = 10000, replace = TRUE)$
  density(kernel = "gaussian")$
  plot(col = "red", main = "density of mpg (bootstrap)")

# Argument-based pipeline using pipeline():
pipeline(mtcars$mpg,
  sample(size = 10000, replace = TRUE),
  density(kernel = "gaussian"),
  plot(col = "red", main = "density of mpg (bootstrap)"))

# Expression-based pipeline using pipeline():
pipeline({
  mtcars$mpg
  sample(size = 10000, replace = TRUE)
  density(kernel = "gaussian")
  plot(col = "red", main = "density of mpg (bootstrap)")
})




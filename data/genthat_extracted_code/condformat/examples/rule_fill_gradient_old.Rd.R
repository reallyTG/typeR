library(condformat)


### Name: rule_fill_gradient_old
### Title: Fill column with sequential colour gradient (deprecated)
### Aliases: rule_fill_gradient_old

### ** Examples

data(iris)
condformat(iris[c(1:5, 70:75, 120:125), ]) +
  rule_fill_gradient(Sepal.Length) +
  rule_fill_gradient(Species, expression=Sepal.Length - Sepal.Width)




library(condformat)


### Name: rule_fill_gradient_
### Title: Fill column with sequential colour gradient (deprecated)
### Aliases: rule_fill_gradient_

### ** Examples

data(iris)
condformat(iris[1:5,]) + rule_fill_gradient_(columns=c("Sepal.Length"))
ex1 <- condformat(iris[1:5,]) +
  rule_fill_gradient_("Species", expression=~Sepal.Length-Sepal.Width)
# Use it programmatically:
gradient_color_column1_minus_column2 <- function(x, column_to_paint, column1, column2) {
  condformat(x) +
    rule_fill_discrete_(column_to_paint,
     expression=~ uq(as.name(column1)) - uq(as.name(column2)))
}
ex2 <- gradient_color_column1_minus_column2(iris[1:5,], "Species", "Sepal.Length", "Sepal.Width")
stopifnot(ex1 == ex2)




library(condformat)


### Name: rule_fill_gradient2_
### Title: Fill column with divergent color gradient (deprecated)
### Aliases: rule_fill_gradient2_

### ** Examples

data(iris)
condformat(iris[1:10,]) + rule_fill_gradient2_(columns=c("Sepal.Length"))
condformat(iris[1:10,]) + rule_fill_gradient2_("Species",
   expression= ~Sepal.Length-Sepal.Width)

# Use it programmatically
color_column <- function(x, column) {
  condformat(x) +
    rule_fill_gradient2_(column, expression=~ uq(as.name(column)))
}
color_column(iris[c(1,51,101),], "Sepal.Length")





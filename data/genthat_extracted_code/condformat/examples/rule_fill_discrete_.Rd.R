library(condformat)


### Name: rule_fill_discrete_
### Title: Fill column with discrete colors (deprecated)
### Aliases: rule_fill_discrete_

### ** Examples

data(iris)
condformat(iris[c(1,51,101), ]) +
 rule_fill_discrete_(columns=c("Species"))
condformat(iris[c(1,51,101), ]) +
 rule_fill_discrete_("Species", expression=~Sepal.Length > 6)

# Use it programmatically:
color_column_larger_than_threshold <- function(x, column, threshold) {
  condformat(x) +
    rule_fill_discrete_(column,
     expression=~ uq(as.name(column))> uq(threshold))
}
color_column_larger_than_threshold(iris[c(1,51,101),], "Sepal.Length", 6.3)

condformat(iris[c(1,51,101),]) +
 rule_fill_discrete_(columns = list(~dplyr::starts_with("Petal"), "Species"),
                     expression=~Species)

# Custom discrete color values can be specified with a function. The function takes
# the whole column and returns a vector with the colours.
color_pick <- function(column) {
  sapply(column,
    FUN = function(value) {
      if (value < 4.7) {
        return("red")
      } else if (value < 5.0) {
        return("yellow")
      } else {
        return("green")
      }
    })
}
condformat(head(iris)) +
   rule_fill_discrete_("Sepal.Length", ~ color_pick(Sepal.Length), colours = identity)





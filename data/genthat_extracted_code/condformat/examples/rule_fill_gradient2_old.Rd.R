library(condformat)


### Name: rule_fill_gradient2_old
### Title: Fill column with divergent color gradient (deprecated)
### Aliases: rule_fill_gradient2_old

### ** Examples

data(iris)
condformat(iris[c(1:5, 70:75, 120:125), ]) +
 rule_fill_gradient2(Sepal.Length) +
 rule_fill_gradient2(Species, expression=Sepal.Length - Sepal.Width)




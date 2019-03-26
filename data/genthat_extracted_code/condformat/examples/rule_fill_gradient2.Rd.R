library(condformat)


### Name: rule_fill_gradient2
### Title: Fill column with sequential color gradient
### Aliases: rule_fill_gradient2

### ** Examples

data(iris)
condformat(iris[c(1:5, 70:75, 120:125), ]) %>%
 rule_fill_gradient2(Sepal.Length) %>%
 rule_fill_gradient2(Species, expression=Sepal.Length - Sepal.Width)

condformat(iris[c(1:5, 70:75, 120:125), ]) %>%
  rule_fill_gradient2("Petal.Length") %>%
  rule_fill_gradient2(starts_with("Sepal"), expression=Sepal.Length - Sepal.Width)





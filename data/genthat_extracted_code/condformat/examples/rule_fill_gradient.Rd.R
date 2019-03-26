library(condformat)


### Name: rule_fill_gradient
### Title: Fill column with sequential colour gradient
### Aliases: rule_fill_gradient

### ** Examples

data(iris)
condformat(iris[c(1:5, 70:75, 120:125), ]) %>%
  rule_fill_gradient(Sepal.Length) %>%
  rule_fill_gradient(Species, expression=Sepal.Length - Sepal.Width)

condformat(iris[c(1:5, 70:75, 120:125), ]) %>%
  rule_fill_gradient("Petal.Length") %>%
  rule_fill_gradient(starts_with("Sepal"), expression=Sepal.Length - Sepal.Width)





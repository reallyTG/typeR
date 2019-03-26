library(condformat)


### Name: rule_fill_bar
### Title: Fill column with a bar of a length proportional to a value
### Aliases: rule_fill_bar

### ** Examples

data(iris)
condformat(iris[c(1:5, 70:75, 120:125), ]) %>% rule_fill_bar("Sepal.Length")




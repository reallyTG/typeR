library(condformat)


### Name: condformat
### Title: Conditional formatting for data frames
### Aliases: condformat

### ** Examples

data(iris)
condformat(iris[1:5,])

condformat(iris[1:5,]) %>% rule_fill_gradient(Sepal.Length)

condformat(iris[1:5,]) %>%
 rule_fill_discrete(Sepal.Length, expression=Sepal.Width > 2)




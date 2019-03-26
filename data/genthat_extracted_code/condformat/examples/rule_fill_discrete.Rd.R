library(condformat)


### Name: rule_fill_discrete
### Title: Fill column with discrete colors
### Aliases: rule_fill_discrete

### ** Examples

data(iris)
condformat(iris[c(1:5, 70:75, 120:125), ]) %>%
 rule_fill_discrete("Species", colours = c("setosa" = "red",
                                         "versicolor" = "blue",
                                         "virginica" = "green")) %>%
 rule_fill_discrete("Sepal.Length", expression = Sepal.Length > 4.6,
                    colours=c("TRUE"="red"))

condformat(iris[c(1:5, 70:75, 120:125), ]) %>%
 rule_fill_discrete(c(starts_with("Sepal"), starts_with("Petal")),
                    expression = Sepal.Length > 4.6,
                    colours=c("TRUE"="red"))




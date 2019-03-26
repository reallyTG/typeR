## ------------------------------------------------------------------------
data(iris)
library(condformat)
condformat(iris[c(1:5,70:75, 120:125),]) %>%
  rule_fill_discrete(Species) %>%
  rule_fill_discrete(c(Sepal.Width, Sepal.Length),
                     expression = Sepal.Width > Sepal.Length - 2.25,
                     colours = c("TRUE" = "#7D00FF")) %>%
  rule_fill_gradient2(Petal.Length) %>%
  rule_text_bold(Sepal.Length, Species == "setosa") %>%
  rule_text_color(Sepal.Length, ifelse(Species == "setosa", "yellow", "")) %>%
  rule_fill_bar(Petal.Width, limits = c(0, NA))


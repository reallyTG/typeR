library(condformat)


### Name: rule_text_color
### Title: Give a color to the text according to some expression
### Aliases: rule_text_color

### ** Examples

data(iris)
condformat(iris[c(1:5, 51:55, 101:105),]) %>%
  rule_text_color(Species, expression = ifelse(Species == "setosa", "blue", ""))




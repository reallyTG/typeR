library(condformat)


### Name: rule_text_bold
### Title: Use bold text if a condition is met
### Aliases: rule_text_bold

### ** Examples

data(iris)
condformat(iris[c(1:5, 51:55, 101:105),]) %>%
  rule_text_bold(Species, expression = Species == "setosa")




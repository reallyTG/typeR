library(condformat)


### Name: rule_css
### Title: Apply a CSS style property as a conditional formatting rule
### Aliases: rule_css

### ** Examples

data(iris)
condformat(iris[c(1:5, 51:55, 101:105),]) %>%
  rule_css(Species, expression = ifelse(Species == "setosa", "red", "darkgreen"),
           css_field = "color")




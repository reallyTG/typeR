library(c3)


### Name: c3
### Title: C3
### Aliases: c3

### ** Examples

data <- data.frame(a = c(1,2,3,2), b = c(2,3,1,5))

data %>%
  c3(onclick = htmlwidgets::JS("function(d, element){console.log(d)}"))

data %>%
  c3(axes = list(a = 'y',
                 b = 'y2')) %>%
  y2Axis()

data.frame(sugar = 20, fat = 45, salt = 10) %>%
  c3(onclick = htmlwidgets::JS("function(d, element){dp = d}")) %>%
  c3_pie()





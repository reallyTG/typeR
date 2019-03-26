library(c3)


### Name: tooltip
### Title: C3 Tooltips
### Aliases: tooltip tooltip.c3

### ** Examples

data <- data.frame(a = abs(rnorm(20) *10),
                   b = abs(rnorm(20) *10),
                   c = abs(rnorm(20) *10),
                   d = abs(rnorm(20) *10))
data %>%
  c3() %>%
  tooltip(format = list(title = htmlwidgets::JS("function (x) { return 'Data ' + x; }"),
                        name = htmlwidgets::JS('function (name, ratio, id, index)',
                                               ' { return name; }'),
                        value = htmlwidgets::JS('function (value, ratio, id, index)',
                                                ' { return ratio; }')))





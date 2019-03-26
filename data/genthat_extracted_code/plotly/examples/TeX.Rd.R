library(plotly)


### Name: TeX
### Title: Render TeX in a plotly graph using MathJax
### Aliases: TeX

### ** Examples


plot_ly(x = c(1, 2, 3, 4), y = c(1, 4, 9, 16)) %>%
  layout(title = TeX("\\text{Some mathjax: }\\alpha+\\beta x")) %>%
  config(mathjax = "cdn")




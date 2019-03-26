library(plotly)


### Name: config
### Title: Set the default configuration for plotly
### Aliases: config

### ** Examples


# remove the plotly logo and collaborate button from modebar
config(plot_ly(), displaylogo = FALSE, collaborate = FALSE)

# enable mathjax
# see more examples at https://plot.ly/r/LaTeX/
plot_ly(x = c(1, 2, 3, 4), y = c(1, 4, 9, 16)) %>%
  layout(title = TeX("\\text{Some mathjax: }\\alpha+\\beta x")) %>%
  config(mathjax = "cdn")

# change the language used to render date axes and on-graph text 
# (e.g., modebar buttons)
today <- Sys.Date()
x <- seq.Date(today, today + 360, by = "day")
p <- plot_ly(x = x, y = rnorm(length(x))) %>%
  add_lines()

# japanese
config(p, locale = "ja")
# german
config(p, locale = "de")
# spanish
config(p, locale = "es")
# chinese
config(p, locale = "zh-CN")





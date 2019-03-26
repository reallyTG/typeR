library(htmltools)


### Name: css
### Title: CSS string helper
### Aliases: css

### ** Examples

padding <- 6
css(
  font.family = "Helvetica, sans-serif",
  margin = paste0(c(10, 20, 10, 20), "px"),
  "padding!" = if (!is.null(padding)) padding
)





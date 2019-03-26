library(plotly)


### Name: animation_opts
### Title: Animation configuration options
### Aliases: animation_opts animation animation_slider animation_button

### ** Examples


df <- data.frame(
  x = c(1, 2, 2, 1, 1, 2),
  y = c(1, 2, 2, 1, 1, 2),
  z = c(1, 1, 2, 2, 3, 3)
)
plot_ly(df) %>%
  add_markers(x = 1.5, y = 1.5) %>%
  add_markers(x = ~x, y = ~y, frame = ~z)

# it's a good idea to remove smooth transitions when there is
# no relationship between objects in each view
plot_ly(mtcars, x = ~wt, y = ~mpg, frame = ~cyl) %>%
  animation_opts(transition = 0)

# works the same way with ggplotly
if (interactive()) {
  p <- ggplot(txhousing, aes(month, median)) +
    geom_line(aes(group = year), alpha = 0.3) +
    geom_smooth() +
    geom_line(aes(frame = year, ids = month), color = "red") +
    facet_wrap(~ city)
 
  ggplotly(p, width = 1200, height = 900) %>%
    animation_opts(1000)
}

  
#' # for more, see https://cpsievert.github.io/plotly_book/key-frame-animations.html





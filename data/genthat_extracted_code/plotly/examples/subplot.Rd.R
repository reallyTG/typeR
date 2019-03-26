library(plotly)


### Name: subplot
### Title: View multiple plots in a single view
### Aliases: subplot

### ** Examples


# pass any number of plotly objects to subplot()
p1 <- plot_ly(economics, x = ~date, y = ~uempmed)
p2 <- plot_ly(economics, x = ~date, y = ~unemploy)
subplot(p1, p2, p1, p2, nrows = 2, margin = 0.05)

#'  # anchor multiple traces on the same legend entry
 p1 <- add_lines(p1, color = I("black"), name = "1st", legendgroup = "1st")
 p2 <- add_lines(p2, color = I("red"), name = "2nd", legendgroup = "2nd")
 
 subplot(
   p1, style(p1, showlegend = FALSE),
   p2, style(p2, showlegend = FALSE),
   nrows = 2, margin = 0.05
 )

# or pass a list
economics_long %>%
  split(.$variable) %>%
  lapply(function(d) plot_ly(d, x = ~date, y = ~value)) %>%
  subplot(nrows = NROW(.), shareX = TRUE)
  
# or pass a tibble with a list-column of plotly objects
economics_long %>%
  group_by(variable) %>%
  do(p = plot_ly(., x = ~date, y = ~value)) %>%
  subplot(nrows = NROW(.), shareX = TRUE)
  
# learn more at https://cpsievert.github.io/plotly_book/subplot.html





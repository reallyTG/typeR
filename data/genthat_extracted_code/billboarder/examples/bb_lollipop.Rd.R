library(billboarder)


### Name: bb_lollipop
### Title: Helper for creating a lollipop chart
### Aliases: bb_lollipop

### ** Examples


# From wikipedia
sw <- data.frame(
  film = c("The Force Awakens", "The Phantom Menace", 
           "Revenge of the Sith", "A New Hope",
           "Attack of the Clones", "The Empire Strikes Back",
           "Return of the Jedi"
  ),
  worldwide_gross = c(2068178225, 1027044677, 848754768,
                      775398007, 649398328, 538375067,
                      475106177)
)

# Simple example
billboarder() %>% 
  bb_lollipop(data = sw)

# Fancy example
billboarder() %>% 
  bb_lollipop(data = sw, rotated = TRUE)%>% 
  bb_y_grid(show = TRUE) %>% 
  bb_y_axis(tick = list(
    values = c(0, 5e+08, 1e+09, 1.5e+09, 2e+09),
    outer = FALSE,
    format = htmlwidgets::JS("d3.formatPrefix('$,.0', 1e6)")
  )) %>% 
  bb_x_axis(tick = list(centered = TRUE)) %>% 
  bb_labs(
    title = "Star Wars - Total Lifetime Grosses",
    caption = "Data source : wikipedia"
  )


# With mapping
billboarder(data = sw) %>% 
  bb_lollipop(mapping = bbaes(x = film, y = worldwide_gross))
  




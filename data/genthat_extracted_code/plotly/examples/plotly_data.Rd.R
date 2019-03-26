library(plotly)


### Name: plotly_data
### Title: Obtain data associated with a plotly graph
### Aliases: plotly_data groups.plotly ungroup.plotly group_by_.plotly
###   summarise_.plotly mutate_.plotly do_.plotly arrange_.plotly
###   select_.plotly filter_.plotly distinct_.plotly slice_.plotly
###   rename_.plotly transmute_.plotly

### ** Examples


# use group_by() to define groups of visual markings
p <- txhousing %>%
  group_by(city) %>%
  plot_ly(x = ~date, y = ~sales)
p

# plotly objects preserve data groupings 
groups(p)
plotly_data(p)

# dplyr verbs operate on plotly objects as if they were data frames
p <- economics %>%
  plot_ly(x = ~date, y = ~unemploy / pop) %>%
  add_lines() %>%
  mutate(rate = unemploy / pop) %>% 
  filter(rate == max(rate))
plotly_data(p)
add_markers(p)
layout(p, annotations = list(x = ~date, y = ~rate, text = "peak"))

# use group_by() + do() + subplot() for trellis displays 
d <- group_by(mpg, drv)
plots <- do(d, p = plot_ly(., x = ~cty, name = ~drv))
subplot(plots[["p"]], nrows = 3, shareX = TRUE)

# arrange displays by their mean
means <- summarise(d, mn = mean(cty, na.rm = TRUE))
means %>%
  dplyr::left_join(plots) %>%
  arrange(mn) %>%
  subplot(nrows = NROW(.), shareX = TRUE)
  
# more dplyr verbs applied to plotly objects
p <- mtcars %>%
  plot_ly(x = ~wt, y = ~mpg, name = "scatter trace") %>%
  add_markers()
p %>% slice(1) %>% plotly_data()
p %>% slice(1) %>% add_markers(name = "first observation")
p %>% filter(cyl == 4) %>% plotly_data()
p %>% filter(cyl == 4) %>% add_markers(name = "four cylinders")






library(echarts4r)


### Name: e_tooltip
### Title: Tooltip
### Aliases: e_tooltip e_tooltip_item_formatter e_tooltip_pie_formatter
###   e_tooltip_pointer_formatter

### ** Examples

# basic
USArrests %>% 
  e_charts(Assault) %>% 
  e_scatter(Murder) %>% 
  e_tooltip()
  
# formatter
cars %>% 
  dplyr::mutate(
    dist = dist / 120
  ) %>% 
  e_charts(speed) %>% 
  e_scatter(dist, symbol_size = 5) %>% 
  e_tooltip(
    formatter = e_tooltip_item_formatter("percent")
  )

# axis pointer
cars %>% 
  e_charts(speed) %>% 
  e_scatter(dist, symbol_size = 5) %>% 
  e_tooltip(
    formatter = e_tooltip_pointer_formatter("currency"), 
    axisPointer = list(
      type = "cross"
    )
  )





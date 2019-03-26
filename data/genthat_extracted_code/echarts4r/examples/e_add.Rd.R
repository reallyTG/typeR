library(echarts4r)


### Name: e_add
### Title: Add nested data
### Aliases: e_add

### ** Examples

# funnel can take nested itemStyle
# https://ecomfe.github.io/echarts-doc/public/en/option.html#series-funnel.data
funnel <- data.frame(
  stage = c("View", "Click", "Purchase"), 
  value = c(80, 30, 20),
  color = c("blue", "red", "green")
)

funnel %>% 
  e_charts() %>% 
  e_funnel(value, stage) %>% 
  e_add("itemStyle", color)

# Heatmap can take nested label
# https://ecomfe.github.io/echarts-doc/public/en/option.html#series-heatmap.data
v <- LETTERS[1:10]
matrix <- data.frame(
  x = sample(v, 300, replace = TRUE), 
  y = sample(v, 300, replace = TRUE), 
  z = rnorm(300, 10, 1),
  stringsAsFactors = FALSE
) %>% 
  dplyr::group_by(x, y) %>% 
  dplyr::summarise(z = sum(z)) %>% 
  dplyr::ungroup() %>% 
  dplyr::mutate(
    show = TRUE,
    fontStyle = round(runif(dplyr::n(), 5, 12))
  )

matrix %>% 
  e_charts(x) %>% 
  e_heatmap(y, z) %>% 
  e_visual_map(z) %>% 
  e_add(
    "label",
    show,
    fontStyle
  )





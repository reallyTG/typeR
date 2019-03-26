library(echarts4r)


### Name: e_sankey
### Title: Sankey
### Aliases: e_sankey e_sankey_

### ** Examples

sankey <- data.frame(
  source = c("a", "b", "c", "d", "c"),
  target = c("b", "c", "d", "e", "e"),
  value = ceiling(rnorm(5, 10, 1)),
  stringsAsFactors = FALSE
)

sankey %>% 
  e_charts() %>% 
  e_sankey(source, target, value) 





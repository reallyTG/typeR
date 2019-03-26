library(billboarder)


### Name: bb_categories
### Title: Set categories on X axis
### Aliases: bb_categories

### ** Examples

# Simple line with month names as x labels
billboarder() %>% 
  bb_linechart(data = round(rnorm(12))) %>% 
  bb_categories(categories = month.name)
  




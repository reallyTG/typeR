library(ggvis)


### Name: auto_group
### Title: Automatically group data by grouping variables
### Aliases: auto_group

### ** Examples

# One line
mtcars %>% ggvis(~disp, ~mpg, stroke = ~factor(cyl)) %>% layer_paths()
# One line for each level of cyl
mtcars %>% ggvis(~disp, ~mpg, stroke = ~factor(cyl)) %>% group_by(cyl) %>%
  layer_paths()
mtcars %>% ggvis(~disp, ~mpg, stroke = ~factor(cyl)) %>% auto_group() %>%
  layer_paths()

# The grouping column can already be stored as a factor
mtcars2 <- mtcars
mtcars2$cyl <- factor(mtcars2$cyl)
mtcars2 %>% ggvis(~disp, ~mpg, stroke = ~cyl) %>% auto_group() %>%
  layer_paths()




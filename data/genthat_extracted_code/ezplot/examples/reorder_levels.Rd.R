library(ezplot)


### Name: reorder_levels
### Title: Order levels of factor columns using fct_reorder
### Aliases: reorder_levels

### ** Examples

library(magrittr)
ezplot:::reorder_levels(mtcars, "cyl", "1") %>% str
ezplot:::reorder_levels(mtcars, "cyl", "1", FALSE) %>% str
ezplot:::reorder_levels(mtcars, "cyl", "mpg") %>% str




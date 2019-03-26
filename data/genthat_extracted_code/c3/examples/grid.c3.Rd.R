library(c3)


### Name: grid
### Title: C3 Grid
### Aliases: grid grid.c3

### ** Examples

iris %>%
 c3(x = 'Sepal_Length', y = 'Sepal_Width', group = 'Species') %>%
 c3_scatter() %>%
 grid('y') %>%
 grid('x', show = FALSE, lines = data.frame(value=c(5, 6),
                                            text= c('Line 1', 'Line 2')))





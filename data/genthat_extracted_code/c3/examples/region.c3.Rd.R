library(c3)


### Name: region
### Title: Modify region elements on both x and y axis
### Aliases: region region.c3

### ** Examples

iris %>%
 c3(x = 'Sepal_Length', y = 'Sepal_Width', group = 'Species') %>%
 c3_scatter() %>%
 region(data.frame(axis = 'x',
                   start = 5,
                   end = 6))





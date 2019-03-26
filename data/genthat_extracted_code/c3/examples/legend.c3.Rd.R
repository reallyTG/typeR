library(c3)


### Name: legend
### Title: C3 Legend Options
### Aliases: legend legend.c3

### ** Examples

iris %>%
 c3(x='Sepal_Length', y='Sepal_Width', group = 'Species') %>%
 c3_scatter() %>%
 legend(position = 'right')





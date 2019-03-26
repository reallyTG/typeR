library(c3)


### Name: c3_scatter
### Title: Scatter Plots
### Aliases: c3_scatter

### ** Examples

  iris %>%
    c3(x = 'Sepal_Length',
       y = 'Sepal_Width',
       group = 'Species') %>%
    c3_scatter()





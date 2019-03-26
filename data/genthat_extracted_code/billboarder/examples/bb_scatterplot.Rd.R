library(billboarder)


### Name: bb_scatterplot
### Title: Helper for creating a scatter chart
### Aliases: bb_scatterplot

### ** Examples

# Use first and second variable by default
billboarder() %>% 
  bb_scatterplot(data = iris)


# Explicit mapping
billboarder() %>% 
  bb_scatterplot(
    data = iris, 
    mapping = bbaes(Petal.Length, Petal.Width)
  ) %>% 
  bb_x_axis(tick = list(fit = FALSE))


# Grouping variable
billboarder() %>% 
  bb_scatterplot(
    data = iris, 
    mapping = bbaes(Sepal.Length, Sepal.Width, group = Species)
  )
  
# Size variable
billboarder() %>% 
  bb_scatterplot(
    data = iris, 
    mapping = bbaes(Sepal.Length, Sepal.Width,
                    group = Species, size = Petal.Width),
    range = c(0.5, 120)
  ) %>% 
  bb_x_axis(tick = list(fit = FALSE))





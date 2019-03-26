library(billboarder)


### Name: bb_densityplot
### Title: Helper for creating a density plot
### Aliases: bb_densityplot

### ** Examples


# With a vector
billboarder() %>%
  bb_densityplot(data = rnorm(1e4))

data("diamonds", package = "ggplot2")

# density plot with one variable
billboarder() %>% 
  bb_densityplot(data = diamonds, x = "carat")

# Same with mapping
billboarder() %>% 
  bb_densityplot(diamonds, bbaes(carat))

# With a grouping variable
billboarder() %>% 
  bb_densityplot(data = diamonds, x = "depth", group = "cut") %>% 
  bb_x_axis(min = 55, max = 70)

# Same with mapping
billboarder() %>% 
  bb_densityplot(diamonds, bbaes(depth, group = cut)) %>% 
  bb_x_axis(min = 55, max = 70)


# a stacked density plot using count as statistic
bb <- billboarder() %>%
  bb_densityplot(diamonds, bbaes(depth, group = cut),
                 stacked = TRUE, stat = "count") %>%
  bb_x_axis(min = 55, max = 70)
bb

# changing order
bb %>% bb_data(order = "asc")





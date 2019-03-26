library(ggvis)


### Name: layer_densities
### Title: Transformation: density estimate
### Aliases: layer_densities

### ** Examples

# Basic density estimate
faithful %>% ggvis(~waiting) %>% layer_densities()
faithful %>% ggvis(~waiting) %>% layer_densities(area = FALSE)

# Control bandwidth with adjust
faithful %>% ggvis(~waiting) %>% layer_densities(adjust = .25)
faithful %>% ggvis(~waiting) %>%
  layer_densities(adjust = input_slider(0.1, 5))

# Control stroke and fill
faithful %>% ggvis(~waiting) %>%
  layer_densities(stroke := "red", fill := "red")

# With groups
PlantGrowth %>% ggvis(~weight, fill = ~group) %>% group_by(group) %>%
  layer_densities()
PlantGrowth %>% ggvis(~weight, stroke = ~group) %>% group_by(group) %>%
  layer_densities(strokeWidth := 3, area = FALSE)




library(treemapify)


### Name: geom_treemap_subgroup_border
### Title: 'ggplot2' geoms to draw a border around a subgroup of treemap
###   tiles.
### Aliases: geom_treemap_subgroup_border geom_treemap_subgroup2_border
###   geom_treemap_subgroup3_border

### ** Examples


ggplot2::ggplot(G20, ggplot2::aes(area = gdp_mil_usd, fill = hdi,
                                  subgroup = hemisphere, subgroup2 = region)) +
  geom_treemap() +
  geom_treemap_subgroup2_border(colour = "white") +
  geom_treemap_subgroup_border()





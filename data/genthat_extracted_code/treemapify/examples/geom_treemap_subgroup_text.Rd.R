library(treemapify)


### Name: geom_treemap_subgroup_text
### Title: 'ggplot2' geoms to add text labels to treemap subgroups.
### Aliases: geom_treemap_subgroup_text geom_treemap_subgroup2_text
###   geom_treemap_subgroup3_text

### ** Examples


ggplot2::ggplot(G20, ggplot2::aes(area = gdp_mil_usd, fill = hdi,
                                  subgroup = hemisphere, subgroup2 = region)) +
  geom_treemap() +
  geom_treemap_subgroup_text(place = "centre", grow = TRUE, alpha = 0.5) +
  geom_treemap_subgroup2_text()





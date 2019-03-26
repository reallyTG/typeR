library(treemapify)


### Name: geom_treemap_text
### Title: A 'ggplot2' geom to add text labels to treemap tiles.
### Aliases: geom_treemap_text

### ** Examples


ggplot2::ggplot(G20, ggplot2::aes(area = gdp_mil_usd,
                                  fill = econ_classification,
                                  label = country)) +
  geom_treemap() +
  geom_treemap_text()





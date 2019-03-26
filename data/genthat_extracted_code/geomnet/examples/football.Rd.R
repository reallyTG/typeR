library(geomnet)


### Name: football
### Title: College football games network (undirected)
### Aliases: football
### Keywords: datasets

### ** Examples

# data step: merge vertices and edges
ftnet <- merge(
  football$edges, football$vertices,
  by.x = "from", by.y = "label", all = TRUE
)

# label independent schools
ftnet$schools <- ifelse(ftnet$value == "Independents", ftnet$from, "")

library(geomnet)
library(dplyr)
# create data plot
ggplot(data = ftnet,
       aes(from_id = from, to_id = to)) +
  geom_net(
    aes(
      colour = value, group = value,
      linetype = factor(1-same.conf),
      label = schools
    ),
    linewidth = 0.5,
    size = 5, vjust = -0.75, alpha = 0.3,
    layout.alg = 'fruchtermanreingold'
  ) +
  theme_net() +
  theme(legend.position = "bottom") +
  scale_colour_brewer("Conference", palette = "Paired")




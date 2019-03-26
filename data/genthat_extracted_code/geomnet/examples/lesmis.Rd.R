library(geomnet)


### Name: lesmis
### Title: Coappearance network of characters in Les Miserables
###   (undirected)
### Aliases: lesmis
### Keywords: datasets

### ** Examples

# prep the data
lesmisnet <- merge(lesmis$edges, lesmis$vertices, by.x = "from",
                   by.y = "label", all = TRUE)
lesmisnet$degree[is.na(lesmisnet$degree)] <- 0

# create plot
library(geomnet)
library(dplyr)

ggplot(data = lesmisnet, aes(from_id = from, to_id = to,
                             linewidth = degree / 5 + 0.1 )) +
  geom_net(aes(size = degree, alpha = degree),
           colour = "grey30", ecolour = "grey60",
           layout.alg = "fruchtermanreingold", labelon = TRUE, vjust = -0.75) +
  scale_alpha(range = c(0.3, 1)) +
  theme_net()




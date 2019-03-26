library(geomnet)


### Name: soccer
### Title: High school boys' soccer games in Iowa (undirected)
### Aliases: soccer
### Keywords: datasets

### ** Examples

# prep the data
soccernet <- merge(soccer$edges, soccer$vertices, by.x = "home",
                   by.y = "label", all = TRUE)
library(geomnet)
library(dplyr)
# create plot
ggplot(data = soccernet, aes(from_id = home, to_id = away)) +
  geom_net(aes(colour = div, group = div), ealpha = .25,
           layout.alg = 'fruchtermanreingold') +
  facet_wrap(~season) +
  theme_net()




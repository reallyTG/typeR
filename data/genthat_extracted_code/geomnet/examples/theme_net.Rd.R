library(geomnet)


### Name: theme_net
### Title: Theme for network visualization
### Aliases: theme_net

### ** Examples

library(ggplot2)
data(blood)
p <- ggplot(data = blood$edges, aes(from_id = from, to_id = to))
p + geom_net()
p + geom_net() + theme_net()





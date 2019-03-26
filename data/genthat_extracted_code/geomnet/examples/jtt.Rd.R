library(geomnet)


### Name: jtt
### Title: Number of JTTs in a graph
### Aliases: jtt

### ** Examples

data(blood)
ggplot(data= blood$edges) + geom_net(aes(from_id=from, to_id=to), directed=TRUE) + theme_net()
jtt(blood$edges, "from", "to")
# this number is very high compared to the overall number of edges that are not self-loops
nrow(subset(blood$edges, from != to))




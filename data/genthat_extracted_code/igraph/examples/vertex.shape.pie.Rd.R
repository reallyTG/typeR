library(igraph)


### Name: Pie charts as vertices
### Title: Using pie charts as vertices in graph plots
### Aliases: vertex.shape.pie
### Keywords: graphs

### ** Examples

g <- make_ring(10)
values <- lapply(1:10, function(x) sample(1:10,3))
if (interactive()) {
  plot(g, vertex.shape="pie", vertex.pie=values,
       vertex.pie.color=list(heat.colors(5)),
       vertex.size=seq(10,30,length=10), vertex.label=NA)
}




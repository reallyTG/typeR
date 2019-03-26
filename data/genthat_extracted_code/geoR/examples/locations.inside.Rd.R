library(geoR)


### Name: locations.inside
### Title: Select prediction locations inside borders
### Aliases: locations.inside
### Keywords: spatial

### ** Examples

gr <- pred_grid(parana$borders, by=20)
plot(gr, asp=1, pch="+")
polygon(parana$borders)
gr.in <- locations.inside(gr, parana$borders)
points(gr.in, col=2, pch="+")




library(qlcVisualize)


### Name: heeringa
### Title: Heeringa-style colours
### Aliases: heeringa

### ** Examples

data(hessen)
tessalation <- voronoi(hessen$villages, hessen$boundary)
d <- dist(hessen$data, method = "canberra")

# different mappings of the colors
c1 <- heeringa(d)
vmap(tessalation, col = c1, border = NA)

c2 <- heeringa(d, power = 1, mapping = c(3, -2, 1))
vmap(tessalation, col = c2, border = NA)




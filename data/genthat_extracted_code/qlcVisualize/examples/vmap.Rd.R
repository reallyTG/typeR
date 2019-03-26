library(qlcVisualize)


### Name: vmap
### Title: Plotting a Voronoi-map ("v-map")
### Aliases: vmap voronoimap voronoi

### ** Examples

# make a voronoi tessellation for some villages in hessen
data(hessen)
plot(hessen$boundary)
points(hessen$villages, cex = 0.3)

tessellation <- voronoi(hessen$villages, hessen$boundary)
plot(tessellation)

# make a resizable plot with random colour specification
vmap(tessellation, col = rainbow(5), border = NA)
legend("bottomright", legend = c("a","b","c","d","e"), fill = rainbow(5))

# use actual colors from data, using first feature from supplied data
# multiple levels cannot easily be shown
# consider lmap for more detail
d1 <- hessen$data[,1:3]
d1 <- d1[,1]/rowSums(d1)
vmap(tessellation, col = rgb(1, 1-d1, 1-d1))
text(hessen$villages,labels=hessen$data[,1],cex=.5)
legend("bottomright", legend = c("es mir", "mir es / other"),
  fill = c("red", "white"))

# Use distances to determine colour, as proposed by Heeringa (2004)
# Note that different methods to establish distances can lead to rather
# different results! Also try method = "euclidean"
d <- dist(hessen$data, method = "canberra")
cols <- heeringa(d)
vmap(tessellation, col = cols, border = NA)





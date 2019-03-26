library(TDAstats)


### Name: plot_barcode
### Title: Plot Persistent Homology as Topological Barcode
### Aliases: plot_barcode

### ** Examples


# create a 2-d point cloud of a circle (100 points)
num.pts <- 100
rand.angle <- runif(num.pts, 0, 2*pi)
pt.cloud <- cbind(cos(rand.angle), sin(rand.angle))

# calculate persistent homology (num.pts by 3 numeric matrix)
pers.hom <- calculate_homology(pt.cloud)

# plot calculated homology features as persistence diagram
plot_barcode(pers.hom)




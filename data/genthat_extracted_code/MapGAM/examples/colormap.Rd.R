library(MapGAM)


### Name: colormap
### Title: Maps Predicted Values and Clusters on a Two-Dimentional Map
### Aliases: colormap
### Keywords: hplot misc smooth

### ** Examples

data(MAdata)
data(MAmap)
obj <- list(grid=data.frame(MAdata$Xcoord,MAdata$Ycoord),fit=MAdata$Mercury)
colormap(obj, MAmap, legend.name = "mercury")

# map the same data using a divergent color palette anchored to the median
if (require(colorspace)) {
  newpal <- diverge_hsv(201)   # from the colorspace library
  colormap(obj, MAmap, legend.name = "mercury", col.seq = newpal, 
	legend.add.line=round(median(obj$fit),2), anchor = TRUE)
  }




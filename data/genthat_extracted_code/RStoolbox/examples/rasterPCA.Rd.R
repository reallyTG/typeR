library(RStoolbox)


### Name: rasterPCA
### Title: Principal Component Analysis for Rasters
### Aliases: rasterPCA

### ** Examples

library(ggplot2)
library(reshape2)
data(rlogo)
ggRGB(rlogo, 1,2,3)

## Run PCA
set.seed(25)
rpc <- rasterPCA(rlogo)
rpc
summary(rpc$model)

ggRGB(rpc$map,1,2,3, stretch="lin", q=0)
if(require(gridExtra)){
plots <- lapply(1:3, function(x) ggR(rpc$map, x, geom_raster = TRUE))
grid.arrange(plots[[1]],plots[[2]], plots[[3]], ncol=2)
}




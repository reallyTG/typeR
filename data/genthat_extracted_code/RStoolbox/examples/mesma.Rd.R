library(RStoolbox)


### Name: mesma
### Title: Multiple Endmember Spectral Mixture Analysis (Spectral Unmixing)
### Aliases: mesma

### ** Examples


#load packages
library(raster)
library(RStoolbox)

#load an example dataset
data(lsat)

#make up some endmember spectra: water and land
em_names <- c("water", "land")
pts <- data.frame(class=em_names, cell = c(47916,5294))
em <- lsat[pts$cell]
rownames(em) <- em_names

#unmix the image for water and land
probs <- mesma(lsat, em, method = "NNLS")

#take a look
raster::hist(probs$water)
raster::plot(probs$water, col = c("white","blue"))
raster::hist(probs$land)
raster::plot(probs$land, col = c("white","brown"))





library(raptr)


### Name: rasterizeGDAL
### Title: Rasterize polygon data using GDAL
### Aliases: rasterizeGDAL

### ** Examples

## No test: 
# load dat
data(cs_pus,cs_spp)

# rasterize spatial polygon data
x <- rasterizeGDAL(cs_pus[1:5,], cs_spp[[1]])

# plot data
par(mfrow = c(1,2))
plot(cs_pus[1:5,], main = "original data")
plot(x, main = "rasterized data")
## End(No test)





library(eseis)


### Name: spatial_convert
### Title: Convert coordinates between reference systems
### Aliases: spatial_convert
### Keywords: eseis

### ** Examples


## create lat lon coordinates
xy <- c(13, 55)

## define output coordinate system 
proj_out <- "+proj=utm +zone=32 +datum=WGS84"

## convert coordinate pair
spatial_convert(data = xy, 
                to = proj_out)
                
## define set of coordinates
xy <- data.frame(x = c(10, 11),
                 y = c(54, 55))
                 
## convert set of coordinates
spatial_convert(data = xy, 
                to = proj_out)
                     




library(foto)


### Name: foto
### Title: Calculates FOTO classification of texture
### Aliases: foto
### Keywords: foto, radial spectrum

### ** Examples


## No test: 
# load demo data
r <- raster::raster(system.file("extdata", "yangambi.png", package = "foto",
     mustWork = TRUE))

# classify pixels using zones (discrete steps)
output <- foto(r,
               plot = TRUE,
               window_size = 25,
               method = "zones")

# print data structure
print(names(output))
## End(No test)




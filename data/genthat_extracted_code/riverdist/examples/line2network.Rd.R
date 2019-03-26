library(riverdist)


### Name: line2network
### Title: Create a River Network Object from a Shapefile
### Aliases: line2network

### ** Examples

filepath <- system.file("extdata", package="riverdist")

Gulk_UTM5 <- line2network(path=filepath, layer="Gulk_UTM5")
plot(Gulk_UTM5)

# # Re-projecting in Alaska Albers Equal Area projection:

AKalbers <- "+proj=aea +lat_1=55 +lat_2=65 +lat_0=50 +lon_0=-154 
    +x_0=0 +y_0=0 +datum=NAD83 +units=m +no_defs +ellps=GRS80 +towgs84=0,0,0"
    
Gulk_AKalbers <- line2network(path=filepath, layer="Gulk_UTM5", reproject=AKalbers)
plot(Gulk_AKalbers)





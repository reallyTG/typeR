library(water)


### Name: createAoi
### Title: Create aoi polygon from topleft and bottomright coordinates
### Aliases: createAoi

### ** Examples

tl <- c(493300, -3592700)
br <- c(557200, -3700000) 
aoi <- createAoi(topleft = tl, bottomright=br, EPSG=32619)
plot(aoi)




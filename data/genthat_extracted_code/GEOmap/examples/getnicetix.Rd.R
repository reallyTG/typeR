library(GEOmap)


### Name: getnicetix
### Title: Nice Looking Lat-Lon pairs for plotting
### Aliases: getnicetix
### Keywords: misc

### ** Examples

proj = setPROJ(7, LAT0 = 0 , LON0= -93)
rx = c(652713.4, 656017.4)
ry = c(1629271, 1631755)

   gloc = XY.GLOB(rx, ry, proj)
    
    G = getnicetix(gloc$lat, gloc$lon)
 
print(G)









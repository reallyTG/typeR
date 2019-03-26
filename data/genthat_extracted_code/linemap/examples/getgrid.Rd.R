library(linemap)


### Name: getgrid
### Title: Transform a Polygon Layer to a Grid
### Aliases: getgrid

### ** Examples

library(linemap)
library(sf)
data("bretagne")
data("france")
# example on an extract of dataset
cotedarmor <- bretagne[bretagne$CODE_DEPT == 22, ]
cota <- getgrid(x = cotedarmor, cellsize = 1750, var = "POPULATION")
opar <- par(mar = c(0,0,0,0))
plot(st_geometry(france), col="lightblue3", border = NA, bg = "lightblue2",
     xlim = c(min(cota$X), max(cota$X)), ylim= c(min(cota$Y), max(cota$Y)))
linemap(x = cota, var = "POPULATION", k = 5, threshold = 1,
        col = "lightblue3", border = "white", lwd = 0.8,
        add = TRUE)
par(opar)


## No test: 
# example on the full dataset
bret <- getgrid(x = bretagne, cellsize = 1750, var = "POPULATION")
opar <- par(mar = c(0,0,0,0))
plot(st_geometry(france), col="lightblue3", border = NA, bg = "lightblue2",
     xlim = c(min(bret$X), max(bret$X)), ylim= c(min(bret$Y), max(bret$Y)))
linemap(x = bret, var = "POPULATION", k = 5, threshold = 1,
        col = "lightblue3", border = "white", lwd = 0.8,
        add = TRUE)
par(opar)
## End(No test)




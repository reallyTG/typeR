library(adehabitatMA)


### Name: subsetmap
### Title: Storing a Part of a Map
### Aliases: subsetmap
### Keywords: spatial

### ** Examples


data(lynxjura)
map <- lynxjura$map

## limits of the new map:
xl <- c(839938.7, 858990.8)
yl <- c(2149019, 2168761)

## computation of the new map:
su <- subsetmap(map, xlim = xl, ylim = yl)
su

## Display
opar <- par(mar = c(0,0,0,0))
layout(matrix(c(1,1,1,1,1,1,1,1,2), byrow = TRUE, ncol = 3))
image(map, axes = FALSE)
polygon(c(xl[1], xl[2], xl[2], xl[1]),
        c(yl[1], yl[1], yl[2], yl[2]))
image(su, axes = FALSE)
box()

par(opar)
par(mfrow = c(1,1))


## Not run: 
##D  ## Interactive example 
##D  su <- subsetmap(map)
##D 
##D  image(su)
## End(Not run)





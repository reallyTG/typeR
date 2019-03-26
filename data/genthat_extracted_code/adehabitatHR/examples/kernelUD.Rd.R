library(adehabitatHR)


### Name: kernelUD
### Title: Estimation of Kernel Home-Range
### Aliases: kernelUD print.estUDm image.estUD image.estUDm plotLSCV
###   getvolumeUD kernel.area estUDm2spixdf as.data.frame.estUD
### Keywords: spatial

### ** Examples


## Load the data
data(puechabonsp)
loc <- puechabonsp$relocs

## have a look at the data
head(as.data.frame(loc))
## the first column of this data frame is the ID


## Estimation of UD for the four animals
(ud <- kernelUD(loc[,1]))

## The UD of the four animals
image(ud)

## Calculation of the 95 percent home range
ver <- getverticeshr(ud, 95)

## and display on an elevation map:
elev <- puechabonsp$map
image(elev, 1)
plot(ver, add=TRUE, col=rainbow(4))
legend(699000, 3165000, legend = names(ud), fill = rainbow(4))

## Example of estimation using LSCV
udbis <- kernelUD(loc[,1], h = "LSCV")
image(udbis)


## Compare the estimation with ad hoc and LSCV method
## for the smoothing parameter
(cuicui1 <- kernel.area(ud)) ## ad hoc
plot(cuicui1)
(cuicui2 <- kernel.area(udbis)) ## LSCV
plot(cuicui2)

## Diagnostic of the cross-validation
plotLSCV(udbis)



## Use of the same4all argument: the same grid
## is used for all animals
## BTW, we indicate a grid with a fine resolution:
udbis <- kernelUD(loc[,1], same4all = TRUE, grid = 100)
image(udbis)


## Estimation of the UD on a map
## (e.g. for subsequent analyses on habitat selection)
## Measures the UD in each pixel of the map
udbis <- kernelUD(loc[,1], grid = elev)
image(udbis)


##########################################
##
## Estimating the UD with the presence of a barrier
## The boars are located on the plateau of Puechabon (near
## Montpellier, France), and their movements are limited by the
## Herault river.

## We first map the elevation:
image(elev)

## Then, we used the function locator() to identify the limits of the
## segments of this barrier. BEWARE! The boundary should satisfy the two
## constraints: (i) segment length > 3*h, (ii) no angle lower than pi/2
## between successive segments. We choose a smoothing parameter of 100
## m, so that no segment length should be less than 300 m.
## Because the resolution of the map is 100 m, this means that no
## segment should cover less than 3 pixels. We have used the function
## locator() to digitize this barrier and then the function dput to
## have the following limits:

bound <- structure(list(x = c(701751.385381925, 701019.24105475,
                        700739.303517889,
                        700071.760160759, 699522.651915378,
                        698887.40904327, 698510.570051342,
                        698262.932999504, 697843.026694212,
                        698058.363261028),
                        y = c(3161824.03387414,
                        3161824.03387414, 3161446.96718494,
                        3161770.16720425, 3161479.28718687,
                        3161231.50050539, 3161037.5804938,
                        3160294.22044937, 3159389.26039528,
                        3157482.3802813)), .Names = c("x", "y"))

lines(bound, lwd=3)

## We convert bound to SpatialLines:
bound <- do.call("cbind",bound)
Slo1 <- Line(bound)
Sli1 <- Lines(list(Slo1), ID="frontier1")
barrier <- SpatialLines(list(Sli1))

## estimation of the UD
kud <- kernelUD(loc[,1], h=100, grid=100, boundary=barrier)

## Result:
image(kud)

## Have a closer look to Calou:
kud2 <- kud[[2]]
image(kud2, col=grey(seq(1,0,length=15)))
title(main="Home range of Calou")
points(loc[slot(loc,"data")[,1]=="Calou",], pch=3, col="blue")
plot(getverticeshr(kud2, 95), add=TRUE, lwd=2)
lines(barrier, col="red", lwd=3)







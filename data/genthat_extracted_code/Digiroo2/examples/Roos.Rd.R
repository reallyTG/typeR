library(Digiroo2)


### Name: Roos
### Title: Social network study of Eastern grey kangaroos
### Aliases: Roos
### Keywords: datasets

### ** Examples


## Load required packages
library(adehabitatHR)

## Load study data
data(Roos)

## Convert df into a spatial points df object
coordinates(Roos) <- ~x+y

## Plot observed location data with individual kangaroos by colour
plot(Roos,col='red')

## Estimation of UD for the 10 kangaroos
ud <- kernelUD(Roos, same4all=TRUE)

## Plot the UD for the 10 kangaroos
image(ud)





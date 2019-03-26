library(spaa)


### Name: geodist
### Title: Hight precision Great circle distance between two places
### Aliases: geodist
### Keywords: distance

### ** Examples


## geodist() example
## Paris
L1 = deg2dec(-2,20,14)
phi1 = deg2dec(48, 50, 11)
## Washington DC
L2 = deg2dec(77,03,56)
phi2 = deg2dec(38,55,17)
##High precision Great Circle distance
geodist(L1, phi1, L2, phi2)





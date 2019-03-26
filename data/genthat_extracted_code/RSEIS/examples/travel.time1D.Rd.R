library(RSEIS)


### Name: travel.time1D
### Title: Seismic Travel Time 1D
### Aliases: travel.time1D many.time1D
### Keywords: misc

### ** Examples



data(VELMOD1D)

v <- VELMOD1D

tees <- travel.time1D(23, 7, 0, length(v$zs) , v$zp , v$vp)

print(tees)





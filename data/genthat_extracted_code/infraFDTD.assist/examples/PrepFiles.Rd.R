library(infraFDTD.assist)


### Name: PrepFiles
### Title: Generate Input Files for infraFDTD
### Aliases: PrepFiles
### Keywords: IO file

### ** Examples

## generate the DEM
data(volcano) # Maunga Whau (NZ) from built-in package "datasets"
DEM = list(x = 10 * 1:87, y = 10 * 1:61, z = volcano)

## choose the station locations
sta = list(x = c(100, 500), y = c(100, 500))

## show the topo map with stations
image(DEM, col = terrain.colors(20))
contour(DEM, add = TRUE)
points(sta, pch = 25, bg = 1)

## make the input files for infraFDTD, using the default homogeneous
## sound speed and density
PrepFiles(X = DEM, sta = sta, dh = 10, fn_topo = 'topo.txt', fn_c =
'c.txt', fn_rho = 'rho.txt', fn_sta = 'sta.txt')




library(rgr)


### Name: map.z
### Title: Plot a Map of Data using Proportional Symbols
### Aliases: map.z
### Keywords: hplot

### ** Examples
 
## Make test data available
data(kola.o)
attach(kola.o)

## Plot a default symbol map, p = 0.5 and sfact = 2.5
map.z(UTME, UTMN, Cu)

## Plot a map where the symbols are logarithmically scaled,
## and more appropriately labelled axes
map.z(UTME/1000, UTMN/1000, Cu, p = 0.3679,
	xlab = "Kola Project UTM Eastings (km)",
	ylab = "Kola Project UTM Northings (km)" )


## Plot with differently scaled symbols and more appropriately 
## labelled axes
map.z(UTME/1000, UTMN/1000, Cu, p = 0.3, sfact = 2.0,
	xlab = "Kola Project UTM Eastings (km)",
	ylab = "Kola Project UTM Northings (km)" ) 

## Plot a map as above but where outliers above a value of 1000 are
## displayed with the same symbol
map.z(UTME/1000, UTMN/1000, Cu, p = 0.3, sfact = 2.0, zmax = 1000,
	xlab = "Kola Project UTM Eastings (km)",
	ylab = "Kola Project UTM Northings (km)" )

## Detach test data
detach(kola.o) 




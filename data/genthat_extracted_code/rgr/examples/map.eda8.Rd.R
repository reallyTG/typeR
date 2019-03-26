library(rgr)


### Name: map.eda8
### Title: Plot a Symbol Map of Data Based on their Percentiles
### Aliases: map.eda8
### Keywords: hplot

### ** Examples
 
## Make test data available
data(kola.o)
attach(kola.o)

## Plot a default symbol map
map.eda8(UTME, UTMN, Cu)

## Plot a more appropriately labelled map
map.eda8(UTME/1000, UTMN/1000, Cu, 
	xlab = "Kola Project UTM Eastings (km)",
	ylab = "Kola Project UTM Northings (km)") 

## Plot a grey-scale equivalent of the above map
map.eda8(UTME/1000, UTMN/1000, Cu, ifgrey = TRUE,
	xlab = "Kola Project UTM Eastings (km)",
	ylab = "Kola Project UTM Northings (km)") 

## Plot the same map with an alternate colour scheme
map.eda8(UTME/1000, UTMN/1000, Cu,
	xlab = "Kola Project UTM Eastings (km)",
	ylab = "Kola Project UTM Northings (km)",
	symcolr = c(27, 24, 22, 12, 12, 5, 3, 36)) 

## Detach test data
detach(kola.o) 




library(rgr)


### Name: map.eda7
### Title: Plot a Symbol Map of Data Based on the Tukey Boxplot
### Aliases: map.eda7
### Keywords: hplot

### ** Examples
 
## Make test data available
data(kola.o)
attach(kola.o)

## Plot a default symbol map
map.eda7(UTME, UTMN, Cu)

## Plot with logarithmically scaled boxplot fences and more
## appropriate axis labelling
map.eda7(UTME/1000, UTMN/1000, Cu, logz = TRUE,
	xlab = "Kola Project UTM Eastings (km)",
	ylab = "Kola Project UTM Northings (km)") 

## Plot a grey-scale equivalent of the above map
map.eda7(UTME/1000, UTMN/1000, Cu, logz = TRUE, ifgrey = TRUE,
	xlab = "Kola Project UTM Eastings (km)",
	ylab = "Kola Project UTM Northings (km)") 

## Plot the same map with an alternate colour scheme
map.eda7(UTME/1000, UTMN/1000, Cu, logz = TRUE, 
	xlab = "Kola Project UTM Eastings (km)",
	ylab = "Kola Project UTM Northings (km)",
	symcolr = c(27, 24, 22, 12, 5, 3, 36)) 

## Detach test data
detach(kola.o) 




library(rgr)


### Name: xyplot.z
### Title: Display a Third Variable in a X-Y Plot using Proportional
###   Symbols
### Aliases: xyplot.z
### Keywords: hplot

### ** Examples
 
## Make test data available
data(sind)
attach(sind)

## Display a default symbol plot, p = 0.5 and sfact = 2.5
xyplot.z(Fe, Mn, Zn)

## Plot with logarithmically scaled symbols and more appropriately
## labelled axes
xyplot.z(Fe, Mn, log10(Zn), p = 1, log = "y",
	xlab = "Fe (pct) in stream sediment",
	ylab = "Mn (mg/kg) in stream sediment") 

## Plot with differently scaled symbols in red and more appropriate
## scaling and labelling with a user specified title
xyplot.z(Fe, Mn, Zn, p = 0.3, sfact = 2.0, log = "y",
	xlab = "Fe (pct) in stream sediment",
	ylab = "Mn (mg/kg) in stream sediment",
	main = "Howarth & Sinding-Larsen Test Data\nZn (mg/kg)", symcolr = 2) 

## Plot as above but where outliers above a value of 1000 displayed
## with the same symbol
xyplot.z(Fe, Mn, Zn, p = 0.3, sfact = 2.0, zmax = 1000, log = "y",
	xlab = "Fe (pct) in stream sediment",
	ylab = "Mn (mg/kg) in stream sediment", 
	main = "Howarth & Sinding-Larsen Test Data\nZn (mg/kg)", symcolr = 2) 

## Detach test data
detach(sind)
rm(sind)

## More appropriately for compositional data
data(nockolds)
attach(nockolds)

## Plot a minor element against the symmetric coordinates for Si and Al, use
## p = 0.3679 to achieve a log ratio
xyplot.z(gx.symm.coords.mat(nockolds, 1, 2), P/Ti, p = 0.3679)

## Detach test data
detach(nockolds)
rm(nockolds)




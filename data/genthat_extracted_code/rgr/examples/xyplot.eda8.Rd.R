library(rgr)


### Name: xyplot.eda8
### Title: Display a Third Variable in a X-Y Plot as Percentiles
### Aliases: xyplot.eda8
### Keywords: hplot

### ** Examples

## Make test data available
data(sind)
attach(sind)

## Plot a default percentile display
xyplot.eda8(Fe, Mn, Zn)

## Plot with more appropriate axis scaling and labelling
## with a user specified title
xyplot.eda8(Fe, Mn, Zn, sfact = 2.0, log = "y",
	xlab = "Fe (pct) in stream sediment",
	ylab = "Mn (mg/kg) in stream sediment",
	main = "Howarth & Sinding-Larsen Test Data\nZn (mg/kg)") 

## Display a grey-scale equivalent of the above plot
xyplot.eda8(Fe, Mn, Zn, sfact = 2, log = "y", ifgrey = TRUE,
	xlab = "Fe (pct) in stream sediment",
	ylab = "Mn (mg/kg) in stream sediment",
	main = "Howarth & Sinding-Larsen Test Data\nZn (mg/kg)") 

## Plot the same display with an alternate colour scheme
xyplot.eda8(Fe, Mn, Zn, sfact = 2, log = "y",
	xlab = "Fe (pct) in stream sediment",
	ylab = "Mn (mg/kg) in stream sediment",
	main = "Howarth & Sinding-Larsen Test Data\nZn (mg/kg)",
	symcolr = c(27, 24, 22, 12, 12, 5, 3, 36)) 

## Detach test data
detach(sind)
rm(sind)

## More appropriately for compositional data
data(nockolds)
attach(nockolds)

## Plot a minor element log ratio against the symmetric coordinates for
## Si and Al
xyplot.eda8(gx.symm.coords.mat(nockolds, 1, 2), log(P/Ti))

## Detach test data
detach(nockolds)
rm(nockolds)




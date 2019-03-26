library(rgr)


### Name: xyplot.eda7
### Title: Display a Third Variable in a X-Y Plot using Tukey Boxplot
###   Symbology
### Aliases: xyplot.eda7
### Keywords: hplot

### ** Examples

## Make test data available
data(sind)
attach(sind)

## Plot a default Tukey boxplot-based display
xyplot.eda7(Fe, Mn, Zn)

## Plot with logarithmically scaled boxplot fences and more
## appropriate axis scaling and labelling with a user specified title
xyplot.eda7(Fe, Mn, Zn, sfact = 2, log = "y", logz = TRUE,
	xlab = "Fe (pct) in stream sediment", 
	ylab = "Mn (mg/kg) in stream sediment",
	main = "Howarth & Sinding-Larsen Test Data\nLog10(Zn) (mg/kg)") 

## Display a grey-scale equivalent of the above plot
xyplot.eda7(Fe, Mn, Zn, sfact = 2, log = "y", logz = TRUE, ifgrey = TRUE,
	xlab = "Fe (pct) in stream sediment", 
	ylab = "Mn (mg/kg) in stream sediment",
	main = "Howarth & Sinding-Larsen Test Data\nLog10(Zn) (mg/kg)") 

## Plot the same display with an alternate colour scheme
xyplot.eda7(Fe, Mn, Zn, sfact = 2, log = "y", logz = TRUE,
	xlab = "Fe (pct) in stream sediment", 
	ylab = "Mn (mg/kg) in stream sediment",
	main = "Howarth & Sinding-Larsen Test Data\nLog10(Zn) (mg/kg)",
	symcolr = c(27, 24, 22, 12, 5, 3, 36)) 

## Detach test data
detach(sind)
rm(sind)

## More appropriately for compositional data
data(nockolds)
attach(nockolds)

## Plot a minor element log ratio against the symmetric coordinates for
## Si and Al
xyplot.eda7(gx.symm.coords.mat(nockolds, 1, 2), log(P/Ti))

## Detach test data
detach(nockolds)
rm(nockolds)




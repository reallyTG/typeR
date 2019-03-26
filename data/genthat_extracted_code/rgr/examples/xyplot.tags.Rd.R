library(rgr)


### Name: xyplot.tags
### Title: Display a Plot of Posted Values for a Third Variable
### Aliases: xyplot.tags
### Keywords: hplot

### ** Examples

## Make test data available
data(sind)
attach(sind)

## Plot the sample site IDs in the x-y space
xyplot.tags(Fe, Mn, ID)

## Plot the data frame row numbers in the x-y space and appropiately
## scale the y-axis
xyplot.tags(Fe, Mn, dimnames(sind)[[1]], log = "y")

## Plot the values for zinc (Zn) in smaller red text in the x-y
## space, providing more appropriate axis scaling and labelling,
## and adding a user specified title
xyplot.tags(Fe, Mn, Zn, log = "y", xlab = "Fe (pct) in stream sediment",
	ylab = "Mn (mg/kg) in stream sediment",
	main = "Howarth & Sinding-Larsen Test Data\nZn (mg/kg)", cex = 0.8, col = 2) 

# Detach test data
detach(sind)
rm(sind) 

## More appropriately for compositional data
data(nockolds)

## Plot the lithological abbreviations against the symmetric
## coordinates for Si and Al
xyplot.tags(gx.symm.coords.mat(nockolds, 1, 2), dimnames(nockolds)[[1]])

## Plot the lithological abbreviations against the symmetric
## coordinates for Si and Al more appropriately scaled and titled
xyplot.tags(gx.symm.coords.mat(nockolds, 1, 2), dimnames(nockolds)[[1]],
        cex = 0.7, main = "Display of lithological abbreviations" )

## Detach test data
rm(nockolds)




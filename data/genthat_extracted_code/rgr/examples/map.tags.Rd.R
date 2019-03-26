library(rgr)


### Name: map.tags
### Title: Plot a Map of Posted Values
### Aliases: map.tags
### Keywords: hplot

### ** Examples

## Make test data available
data(sind)
attach(sind)

## Plot a sample site number map
map.tags(E, N, ID)

## Plot a sample site number map with smaller numbers
## and a wider internal map margin
map.tags(E, N, ID, cex = 0.8, tol = 0.06)

## Plot the data frame row numbers rather than the sample
## numbers
map.tags(E, N, dimnames(sind)[[1]], cex = 0.8, tol = 0.06)

## Plot the values for Zn in red, providing enough internal
## map margin so the values do not overprint the map neat-line
map.tags(E, N, Zn, cex = 0.8, tol = 0.1, col = 2)

## Plot as above but with an informative title spread over
## two lines and with a slightly smaller font
map.tags(E, N, Zn, cex = 0.8, tol = 0.1, col = 2, main =
	"Howarth & Sinding-Larsen\nStream Sediment Zn Data",
	cex.main = 0.9) 

## Detach test data
detach(sind) 




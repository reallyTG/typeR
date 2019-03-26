library(rgr)


### Name: gx.2dproj
### Title: Function to Compute and Display 2-d Projections for Data
###   Matrices
### Aliases: gx.2dproj
### Keywords: multivariate hplot

### ** Examples

## Make test data available
data(sind.mat2open)

## Display default, Sammon non-linear map, 2-d projection
sind.2dproj <- gx.2dproj(sind.mat2open, ifilr = TRUE)

## Display saved object identifying input matrix row numbers (cex = 0.7),
## and with an alternate main title (cex.main = 0.8) 
gx.2dproj.plot(sind.2dproj, rowids = TRUE, cex = 0.7, cex.main = 0.8,
	main = "Howarth & Sinding-Larsen\nStream Sediment ilr Transformed Data")

## Display Kruskal's non-metric multidimensional scaling 2-d projection
sind.2dproj <- gx.2dproj(sind.mat2open, proc = "iso", ifilr = TRUE)

## Display saved object identifying input matrix row numbers (cex = 0.7),
## and with an alternate main title (cex.main = 0.8) 
gx.2dproj.plot(sind.2dproj, rowids = FALSE, cex = 0.7, cex.main = 0.8, 
	main = "Howarth & Sinding-Larsen\nStream Sediment ilr Transformed Data")

## Display default, Sammon non-linear map, 2-d projection, removing the three
## most extreme individuuals
sind.2dproj.trim3 <- gx.2dproj(sind.mat2open, ifilr = TRUE, row.omits = c(13,15,16))

## Clean-up
rm(sind.2dproj)
rm(sind.2dproj.trim3)




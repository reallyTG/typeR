library(rgr)


### Name: gx.2dproj.plot
### Title: Function to Display a Saved 2-d Projection Object
### Aliases: gx.2dproj.plot
### Keywords: hplot

### ** Examples

## Make test data available
data(sind.mat2open)

## Display default 2-d projection
sind.save <- gx.2dproj(sind.mat2open, ifilr = TRUE)

## Display saved object with more informative title
gx.2dproj.plot(sind.save,
main = "Howarth & Sinding-Larsen\nStream Sediments, ilr Transformed Data")

## Display saved object with row identifiers in a smaller blue font
gx.2dproj.plot(sind.save,
main = "Howarth & Sinding-Larsen\nStream Sediments, ilr Transformed Data",
rowids = TRUE, cex = 0.7, col = 4)

## Display 2-d projection after trimming the 3 most extreme samples
sind.2dproj.trim3 <- gx.2dproj(sind.mat2open, ifilr = TRUE, row.omits = c(13,15,16))
gx.2dproj.plot(sind.save,
main = "Howarth & Sinding-Larsen\nStream Sediments, ilr Transformed Data",
rowids = FALSE, cex = 0.7, col = 4)

## Clean-up
rm(sind.save)
rm(sind.2dproj.trim3)




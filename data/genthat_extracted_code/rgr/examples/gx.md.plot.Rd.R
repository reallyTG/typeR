library(rgr)


### Name: gx.md.plot
### Title: Function to Display Chi-square Plots of Mahalanobis Distances
### Aliases: gx.md.plot
### Keywords: hplot

### ** Examples

## Make test data available
data(sind.mat2open)

## Save and display Chi-square plot
sind.save <- gx.mva(ilr(sind.mat2open))
gx.md.plot(sind.save)
gx.md.plot(sind.save,
main = "Howarth & Sinding Larsen Stream Sediments\nilr transform",
cexf = 0.8, cex = 1, col = 2)

## Save and display Chi-square plot with a
## mcd robust start and ilr transformation
sind.save <- gx.md.gait(ilr(sind.mat2open), mcdstart = TRUE, mvtstart = TRUE,
trim = 3, ifadd = NULL)
gx.md.plot(sind.save)
gx.md.plot(sind.save,
main = paste("Howarth & Sinding-Larsen\nStream Sediments, ilr Transformed Data",
"\nMCD robust start"), ifadd = 0.9, cex.main = 0.8)

## Clean-up
rm(sind.save)




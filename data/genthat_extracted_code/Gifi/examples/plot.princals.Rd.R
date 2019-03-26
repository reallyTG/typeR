library(Gifi)


### Name: plot.princals
### Title: Plot Methods for Princals
### Aliases: plot.princals
### Keywords: hplot

### ** Examples

ABC6 <- ABC[,6:11]
fitord <- princals(ABC6, ndim = 3)  ## 3D princals solution

## transformation plot
plot(fitord, plot.type = "transplot", var.subset = 1:4, lwd = 2, col.lines = "coral")

## loadings plot
plot(fitord, "loadplot", main = "Loadings Plot ABC Data")

## biplot
plot(fitord, "biplot", labels.scores = TRUE, main = "Biplot ABC Data", cex.scores = 0.5)  
plot(fitord, "biplot", main = "Biplot ABC Data")
plot(fitord, "biplot", main = "Biplot ABC Data", plot.dim = c(2,3))

## scree plot
plot(fitord, "screeplot")  




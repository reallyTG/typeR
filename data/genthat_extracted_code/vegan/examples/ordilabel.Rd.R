library(vegan)


### Name: ordilabel
### Title: Add Text on Non-transparent Label to an Ordination Plot.
### Aliases: ordilabel
### Keywords: aplot

### ** Examples

data(dune)
ord <- cca(dune)
plot(ord, type = "n")
ordilabel(ord, dis="sites", cex=1.2, font=3, fill="hotpink", col="blue")
## You may prefer separate plots, but here species as well
ordilabel(ord, dis="sp", font=2, priority=colSums(dune))




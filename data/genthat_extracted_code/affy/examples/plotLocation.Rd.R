library(affy)


### Name: plotLocation
### Title: Plot a location on a cel image
### Aliases: plotLocation
### Keywords: aplot

### ** Examples

if (require(affydata)) {
  data(Dilution)

  ## image of the celfile
  image(Dilution[, 1])

  ## genenames, arbitrarily pick the 101th
  n <- geneNames(Dilution)[101]

  ## get the location for the gene n
  l <- indexProbes(Dilution, "both", n)[[1]]
  ## convert the index to X/Y coordinates
  xy <- indices2xy(l, abatch=Dilution) 

  ## plot
  plotLocation(xy)
}




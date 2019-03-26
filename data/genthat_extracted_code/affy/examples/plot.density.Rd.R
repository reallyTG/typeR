library(affy)


### Name: plotDensity
### Title: Plot Densities
### Aliases: plotDensity plotDensity.AffyBatch
### Keywords: hplot

### ** Examples

if (require(affydata)) {
  data(Dilution)
  plotDensity(exprs(Dilution), log="x")
}




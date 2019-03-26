library(affy)


### Name: xy2indices
### Title: Functions to convert indices to x/y (and reverse)
### Aliases: xy2indices indices2xy
### Keywords: manip

### ** Examples

if (require(affydata)) {
  data(Dilution)
  pm.i <- indexProbes(Dilution, which="pm", genenames="AFFX-BioC-5_at")[[1]]
  mm.i <- indexProbes(Dilution, which="mm", genenames="AFFX-BioC-5_at")[[1]]

  pm.i.xy <- indices2xy(pm.i, abatch = Dilution)
  mm.i.xy <- indices2xy(mm.i, abatch = Dilution)

  ## and back to indices
  i.pm <- xy2indices(pm.i.xy[,1], pm.i.xy[,2], cdf = "hgu95av2cdf")
  i.mm <- xy2indices(mm.i.xy[,1], mm.i.xy[,2], cdf = "hgu95av2cdf")

  identical(pm.i, as.integer(i.pm))
  identical(mm.i, as.integer(i.mm))

  image(Dilution[1], transfo=log2)
  ## plot the pm in red
  plotLocation(pm.i.xy, col="red")
  plotLocation(mm.i.xy, col="blue")
}




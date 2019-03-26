library(Luminescence)


### Name: methods_RLum
### Title: methods_RLum
### Aliases: methods_RLum plot.list plot.RLum.Results plot.RLum.Analysis
###   plot.RLum.Data.Curve plot.RLum.Data.Spectrum plot.RLum.Data.Image
###   plot.Risoe.BINfileData hist.RLum.Results hist.RLum.Data.Image
###   hist.RLum.Data.Curve hist.RLum.Analysis summary.RLum.Results
###   summary.RLum.Analysis summary.RLum.Data.Image summary.RLum.Data.Curve
###   subset.Risoe.BINfileData subset.RLum.Analysis bin.RLum.Data.Curve
###   length.RLum.Results length.RLum.Analysis length.RLum.Data.Curve
###   length.Risoe.BINfileData dim.RLum.Data.Curve dim.RLum.Data.Spectrum
###   rep.RLum names.RLum.Data.Curve names.RLum.Data.Spectrum
###   names.RLum.Data.Image names.RLum.Analysis names.RLum.Results
###   names.Risoe.BINfileData row.names.RLum.Data.Spectrum
###   as.data.frame.RLum.Data.Curve as.data.frame.RLum.Data.Spectrum
###   as.list.RLum.Results as.list.RLum.Data.Curve as.list.RLum.Analysis
###   as.matrix.RLum.Data.Curve as.matrix.RLum.Data.Spectrum is.RLum
###   is.RLum.Data is.RLum.Data.Curve is.RLum.Data.Spectrum
###   is.RLum.Data.Image is.RLum.Analysis is.RLum.Results merge.RLum
###   unlist.RLum.Analysis +.RLum.Data.Curve -.RLum.Data.Curve
###   *.RLum.Data.Curve /.RLum.Data.Curve [.RLum.Data.Curve
###   [.RLum.Data.Spectrum [.RLum.Data.Image [.RLum.Analysis [.RLum.Results
###   [<-.RLum.Data.Curve [[.RLum.Analysis [[.RLum.Results
###   $.RLum.Data.Curve $.RLum.Analysis $.RLum.Results
### Keywords: internal

### ** Examples


##load example data
data(ExampleData.RLum.Analysis, envir = environment())


##combine curve is various ways
curve1 <- IRSAR.RF.Data[[1]]
curve2 <-  IRSAR.RF.Data[[1]]
curve1 + curve2
curve1 - curve2
curve1 / curve2
curve1 * curve2


##`$` access curves
IRSAR.RF.Data$RF





library(Luminescence)


### Name: merge_RLum.Analysis
### Title: Merge function for RLum.Analysis S4 class objects
### Aliases: merge_RLum.Analysis
### Keywords: internal utilities

### ** Examples



##merge different RLum objects from the example data
data(ExampleData.RLum.Analysis, envir = environment())
data(ExampleData.BINfileData, envir = environment())

object <- Risoe.BINfileData2RLum.Analysis(CWOSL.SAR.Data, pos=1)
curve <- get_RLum(object)[[2]]

temp.merged <- merge_RLum.Analysis(list(curve, IRSAR.RF.Data, IRSAR.RF.Data))





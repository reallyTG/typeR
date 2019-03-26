library(Luminescence)


### Name: merge_Risoe.BINfileData
### Title: Merge Risoe.BINfileData objects or Risoe BIN-files
### Aliases: merge_Risoe.BINfileData
### Keywords: IO manip

### ** Examples


##merge two objects
data(ExampleData.BINfileData, envir = environment())

object1 <- CWOSL.SAR.Data
object2 <- CWOSL.SAR.Data

object.new <- merge_Risoe.BINfileData(c(object1, object2))





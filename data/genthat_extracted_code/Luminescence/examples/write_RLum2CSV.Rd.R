library(Luminescence)


### Name: write_RLum2CSV
### Title: Export RLum-objects to CSV
### Aliases: write_RLum2CSV
### Keywords: IO

### ** Examples


##transform values to a list
data(ExampleData.BINfileData, envir = environment())
object <- Risoe.BINfileData2RLum.Analysis(CWOSL.SAR.Data)[[1]]
write_RLum2CSV(object, export = FALSE)

## Not run: 
##D 
##D ##export data to CSV-files in the working directory;
##D ##BE CAREFUL, this example creates many files on your file system
##D data(ExampleData.BINfileData, envir = environment())
##D object <- Risoe.BINfileData2RLum.Analysis(CWOSL.SAR.Data)[[1]]
##D write_RLum2CSV(object, export = FALSE)
##D 
## End(Not run)





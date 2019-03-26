library(Luminescence)


### Name: convert_BIN2CSV
### Title: Export Risoe BIN-file(s) to CSV-files
### Aliases: convert_BIN2CSV
### Keywords: IO

### ** Examples


##transform Risoe.BINfileData values to a list
data(ExampleData.BINfileData, envir = environment())
convert_BIN2CSV(subset(CWOSL.SAR.Data, POSITION == 1), export = FALSE)

## Not run: 
##D ##select your BIN-file
##D file <- file.choose()
##D 
##D ##convert
##D convert_BIN2CSV(file)
##D 
## End(Not run)





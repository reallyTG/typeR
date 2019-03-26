library(Luminescence)


### Name: convert_XSYG2CSV
### Title: Export XSYG-file(s) to CSV-files
### Aliases: convert_XSYG2CSV
### Keywords: IO

### ** Examples


##transform XSYG-file values to a list
data(ExampleData.XSYG, envir = environment())
convert_XSYG2CSV(OSL.SARMeasurement$Sequence.Object[1:10], export = FALSE)

## Not run: 
##D ##select your BIN-file
##D file <- file.choose()
##D 
##D ##convert
##D convert_XSYG2CSV(file)
##D 
## End(Not run)





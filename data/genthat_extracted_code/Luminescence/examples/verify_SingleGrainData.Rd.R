library(Luminescence)


### Name: verify_SingleGrainData
### Title: Verify single grain data sets and check for invalid grains, i.e.
###   zero-light level grains
### Aliases: verify_SingleGrainData
### Keywords: datagen manip

### ** Examples


##01 - basic example I
##just show how to apply the function
data(ExampleData.XSYG, envir = environment())

##verify and get data.frame out of it
verify_SingleGrainData(OSL.SARMeasurement$Sequence.Object)$selection_full

##02 - basic example II
data(ExampleData.BINfileData, envir = environment())
id <- verify_SingleGrainData(object = CWOSL.SAR.Data,
cleanup_level = "aliquot")$selection_id

## Not run: 
##D ##03 - advanced example I
##D ##importing and exporting a BIN-file
##D 
##D ##select and import file
##D file <- file.choose()
##D object <- read_BIN2R(file)
##D 
##D ##remove invalid aliquots(!)
##D object <- verify_SingleGrainData(object, cleanup = TRUE)
##D 
##D ##export to new BIN-file
##D write_R2BIN(object, paste0(dirname(file),"/", basename(file), "_CLEANED.BIN"))
## End(Not run)





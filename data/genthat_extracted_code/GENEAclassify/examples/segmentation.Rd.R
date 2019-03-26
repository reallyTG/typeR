library(GENEAclassify)


### Name: segmentation
### Title: Perform Segmentation on GENEActiv Accelerometer Data
### Aliases: segmentation

### ** Examples

### Load the data to segment keeping only the first quarter of the data
## library(GENEAread)
## segData <- dataImport(bindata = "001_w_19_12_12.bin",
##     downsample = 100, start = 0, end = 0.25)
## head(segData)
### Run loaded data through segmentation function
## segment <- segmentation(data = segData, outputfile = NULL)
## head(segment)
## segment2 <- segmentation(data = segData, outputfile = NULL,
##     datacols = "Degrees.skew")
## head(segment2)




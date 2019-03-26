library(MSnbase)


### Name: readMSnSet
### Title: Read 'MSnSet'
### Aliases: readMSnSet readMSnSet2
### Keywords: file manip

### ** Examples

## Not run: 
##D exprsFile <- "path_to_intensity_file.csv"
##D fdatafile <- "path_to_featuredata_file.csv"
##D pdatafile <- "path_to_sampledata_file.csv"
##D ## Read ExpressionSet with appropriate parameters
##D res <- readMSnSet(exprsFile, pdataFile, fdataFile, sep = "\t", header=TRUE)
## End(Not run)

library("pRolocdata")
f0 <- dir(system.file("extdata", package = "pRolocdata"),
          full.names = TRUE,
          pattern = "Dunkley2006")
basename(f0)
res <- readMSnSet2(f0, ecol = 5:20)
res
head(exprs(res)) ## columns 5 to 20
head(fData(res)) ## other columns




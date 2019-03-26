library(phenomap)


### Name: mapTrend
### Title: Convert a series of phenology raster files to a single long-term
###   trend raster.
### Aliases: mapTrend

### ** Examples

## Don't show: 
fpath <- system.file("extdata", package="phenomap")
File_List.Trend <- paste(fpath, list.files(path = fpath, pattern=c("Sample_Greenup_")), sep="/")[5:6]

Year_List <- 2015:2016 # Tell it what years you're using
n.cores <- NA

phenotrend <- mapTrend(File_List = File_List.Trend,
                             Year_List = Year_List,
                             parallel = FALSE,
                             n.cores = n.cores,
                             verbose=FALSE)

## End(Don't show)
## Not run: 
##D 
##D fpath <- system.file("extdata", package="phenomap")
##D File_List.Trend <- paste(fpath, list.files(path = fpath, pattern=c("Sample_Greenup_")), sep="/")
##D 
##D Year_List <- 2011:2016 # Tell it what years you're using
##D n.cores <- 4 # Set up parallel computing
##D 
##D phenotrend <- mapTrend(File_List = File_List.Trend,
##D                              Year_List = Year_List,
##D                              parallel = TRUE,
##D                              n.cores = n.cores,
##D                              verbose=TRUE)
##D 
## End(Not run)




library(seaaroundus)


### Name: catchdata
### Title: Get catch data for a region as a dataframe or stacked area chart
### Aliases: catchdata

### ** Examples

catchdata("eez", 76)
head(catchdata("eez", 76, measure="value", dimension="reporting-status"))
catchdata("eez", 76, measure="value", dimension="sector")
catchdata("eez", 76, measure="value", dimension="taxon")
## Not run: 
##D catchdata(region = "eez", id = 76, chart = TRUE)
## End(Not run)




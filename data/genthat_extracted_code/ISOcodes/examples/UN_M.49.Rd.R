library(ISOcodes)


### Name: UN_M.49
### Title: UN M.49 Area Codes
### Aliases: UN_M.49_Countries UN_M.49_Regions
### Keywords: datasets

### ** Examples

## Name and codes of countries in Southern Europe:
data("UN_M.49_Regions")
data("UN_M.49_Countries")
region <- subset(UN_M.49_Regions, Name == "Southern Europe")
codes <- unlist(strsplit(region$Children, ", "))
subset(UN_M.49_Countries, Code %in% codes)




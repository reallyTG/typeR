library(OIdata)


### Name: processTable
### Title: Process selected columns of a table into numbers
### Aliases: processTable
### Keywords: data frame data processing regular expressions clean data

### ** Examples

## Not run: 
##D URL     <- "http://en.wikipedia.org/wiki/Poverty_in_the_United_States"
##D Tables  <- getTables(URL)
##D thisOne <- which(sapply(Tables, "[", 1, 1) == "Persons in Family Unit")
##D if(length(thisOne) > 0){
##D   temp <- Tables[[thisOne[1]]]
##D   processTable(temp[-c(1),], 1:4)
##D }
##D # warning may be produced for one entry
##D #  "each additional person adds"
## End(Not run)




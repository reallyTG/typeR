library(edgar)


### Name: getMasterIndex
### Title: Retrieves quarterly master index.
### Aliases: getMasterIndex

### ** Examples

## Not run: 
##D 
##D report <- getMasterIndex(1995) 
##D ## Downloads quarterly master index files for the year 1995 and stores into yearly  
##D ## 1995master.Rda file. It returns download report in dataframe format.
##D 
##D report <- getMasterIndex(c(1994, 2006, 2014)) 
##D ## Download quarterly master index files for the years 1994, 1995, 2006 and stores into 
##D ## different {year}master.Rda files. It returns download report in dataframe format.
## End(Not run)




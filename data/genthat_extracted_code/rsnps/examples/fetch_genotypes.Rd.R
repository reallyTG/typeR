library(rsnps)


### Name: fetch_genotypes
### Title: Download openSNP genotype data for a user
### Aliases: fetch_genotypes

### ** Examples

## Not run: 
##D # get a data.frame of the users data
##D data <- users(df = TRUE)
##D head( data[[1]] ) # users with links to genome data
##D mydata <- fetch_genotypes(url = data[[1]][1,"genotypes.download_url"], 
##D   file="~/myfile.txt")
##D 
##D # see some data right away
##D mydata
##D 
##D # Or read in data later separately
##D read.table("~/myfile.txt", nrows=10)
## End(Not run)




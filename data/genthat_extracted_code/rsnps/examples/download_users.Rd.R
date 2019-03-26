library(rsnps)


### Name: download_users
### Title: Download openSNP user files.
### Aliases: download_users

### ** Examples

## Not run: 
##D # Download a single user file, by id
##D download_users(id = 14)
##D 
##D # Download a single user file, by user name
##D download_users(name = 'kevinmcc')
##D 
##D # Download many user files
##D lapply(c(14,22), function(x) download_users(id=x))
##D read_users(id=14, nrows=5)
## End(Not run)




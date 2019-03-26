library(repmis)


### Name: source_data
### Title: Load plain-text data and RData from a URL (either http or https)
### Aliases: source_data

### ** Examples

## Not run: 
##D # Download electoral disproportionality data stored on GitHub
##D # Note: Using shortened URL created by bitly
##D DisData <- source_data("http://bit.ly/156oQ7a")
##D 
##D # Check to see if SHA-1 hash matches downloaded file
##D DisDataHash <- source_data("http://bit.ly/Ss6zDO",
##D    sha1 = "dc8110d6dff32f682bd2f2fdbacb89e37b94f95d")
## End(Not run)




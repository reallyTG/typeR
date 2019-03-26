library(checkpoint)


### Name: mranUrl
### Title: Returns MRAN URL by querying options and defaults.
### Aliases: mranUrl

### ** Examples

mranUrl()  

## Not run: 
##D   
##D # Store the existing options
##D old_opts <- getOption("checkpoint.mranUrl")
##D 
##D # Set MRAN URL to different http address
##D options(checkpoint.mranUrl = "https://foobah")
##D 
##D # Set MRAN URL to local file address
##D options(checkpoint.mranUrl = "file:///~")
##D 
##D # Reset the original options
##D options(checkpoint.mranUrl = old_opts)
## End(Not run)




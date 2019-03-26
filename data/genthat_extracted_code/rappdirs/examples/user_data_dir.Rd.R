library(rappdirs)


### Name: user_data_dir
### Title: Return path to user data directories.
### Aliases: user_config_dir user_data_dir

### ** Examples

user_data_dir("rappdirs")
user_config_dir("rappdirs", version="%p-platform/%v")
user_config_dir("rappdirs", roaming=TRUE, os="win")
user_config_dir("rappdirs", roaming=FALSE, os="win")
user_config_dir("rappdirs", os="unix")
user_config_dir("rappdirs", os="mac")
## Not run: 
##D # you could try to use functions to store R libraries in a standard user directory
##D # by using the following in your .Rprofile file
##D # but unfortunately if rappsdir package was stored in standard user directory then
##D # it won't be on R's search path any longer, so would need to be installed system-wide...
##D require("utils")
##D .libPaths(new=rappdirs::user_config_dir("R", version="%p-platform/%v"))
## End(Not run)




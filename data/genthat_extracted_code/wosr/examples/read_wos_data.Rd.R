library(wosr)


### Name: read_wos_data
### Title: Read WoS data
### Aliases: read_wos_data

### ** Examples

## Not run: 
##D 
##D sid <- auth("your_username", password = "your_password")
##D wos_data <- pull_wos("TS = (dog welfare) AND PY = 2010", sid = sid)
##D 
##D # Write files to working directory
##D write_wos_data(wos_data, ".")
##D # Read data back into R
##D wos_data <- read_wos_data(".")
## End(Not run)




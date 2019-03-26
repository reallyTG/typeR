library(wosr)


### Name: write_wos_data
### Title: Write WoS data
### Aliases: write_wos_data

### ** Examples

## Not run: 
##D 
##D sid <- auth("your_username", password = "your_password")
##D wos_data <- pull_wos("TS = (dog welfare) AND PY = 2010", sid = sid)
##D 
##D # Write files to working directory
##D write_wos_data(wos_data, ".")
##D 
##D # Write files to "wos-data" dir
##D write_wos_data(wos_data, "wos-data")
## End(Not run)




library(rdhs)


### Name: set_rdhs_config
### Title: Set rdhs config
### Aliases: set_rdhs_config

### ** Examples


## Not run: 
##D # normal set up we would prvide the email and project, and be prompted for
##D # the password. (not run as it requires a prompt)
##D set_rdhs_config(email = "blah@gmail.com", project = "Blahs",
##D config_path = "rdhs.json", global = FALSE)
##D 
##D 
##D # otherwise we can do this by specifying prompt to FALSE
##D set_rdhs_config(
##D config_path = "rdhs.json", global = FALSE, prompt = FALSE
##D )
##D 
##D # you can look at what you have set these to using \code{get_rdhs_config}
##D config <- get_rdhs_config()
## End(Not run)






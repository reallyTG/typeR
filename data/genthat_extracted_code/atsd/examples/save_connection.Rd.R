library(atsd)


### Name: save_connection
### Title: Write connection parameters to configuration file.
### Aliases: save_connection

### ** Examples

## Not run: 
##D # Write the current values of the connection parameters to the configuration file
##D save_connection()
##D 
##D # Write the user name and the password to the configuration file
##D save_connection(user = "user001", password = "123456")
##D 
##D # Write all parameters nedeed for https connection to the configuration file
##D save_connection(url = "https://my.company.com:8443", user = "user001", password = "123456", 
##D                 verify = "no", encryption = "ssl3")
## End(Not run)




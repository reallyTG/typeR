library(atsd)


### Name: set_connection
### Title: Set up parameters of a connection with ATSD.
### Aliases: set_connection

### ** Examples

# Modify the user
set_connection(user = "user001")

# Modify the cryptographic protocol
set_connection(encryption = "tls1")

# Set up url, user and password
set_connection(url = "http://my.company.com:8088", user = "user001", password = "123456")
    
# Set up parameters of https connection
set_connection(url = "https://my.company.com:8443", user = "user001", password = "123456", 
               verify = "no", encryption = "ssl3")

## Not run: 
##D # Set up parameters from a file
##D set_connection(file = "/home/user001/atsd_https_connection.txt")
##D  
##D # Set up parameters from the configuration file
##D set_connection()
## End(Not run)
    




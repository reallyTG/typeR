library(healthcareai)


### Name: build_connection_string
### Title: Build a connection string for use with MSSQL and dbConnect
### Aliases: build_connection_string

### ** Examples

## Not run: 
##D my_con <- build_connection_string(server = "localhost")
##D con <- DBI::dbConnect(odbc::odbc(), .connection_string = my_con)
##D 
##D # with username and password
##D my_con <- build_connection_string(server = "localhost",
##D                                   user_id = "jules.winnfield",
##D                                   password = "pathoftherighteous")
##D con <- DBI::dbConnect(odbc::odbc(), .connection_string = my_con)
## End(Not run)




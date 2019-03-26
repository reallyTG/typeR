library(RH2)


### Name: H2Driver-methods
### Title: Methods for the class JDBCDriver in Package 'RJDBC'
### Aliases: H2Driver-methods dbConnect,H2Driver-method
### Keywords: methods

### ** Examples

## Not run: 
##D # in memory database
##D con <- dbConnect(H2(), "jdbc:h2:mem:")
##D dbDisconnect(con)
##D 
##D # external database
##D con <- dbConnect(H2(), "jdbc:h2:~/test")
##D dbDisconnect(con)
##D 
##D # same but run in MySQL compatibility mode
##D con <- dbConnect(H2(), "jdbc:h2:~/test;MODE=MYSQL")
## End(Not run)




library(scidb)


### Name: scidbconnect
### Title: Connect to a SciDB database
### Aliases: scidbconnect

### ** Examples

## Not run: 
##D db <- scidbconnect()
##D 
##D # SciDB 15.12 authentication example (using shim's default HTTPS port 8083)
##D db <- scidbconnect(user="root", password="Paradigm4",
##D                    auth_type="scidb", port=8083, protocol="https")
##D 
##D # List available AFL operators
##D names(db)
##D 
##D # List arrays
##D ls(db)
##D 
##D # Explicitly upload an R matrix to SciDB:
##D x <- as.scidb(db, matrix(rnorm(20), 5))
##D # Implicitly do the same as part of an AFL expression
##D y <- db$join(x,  as.scidb(matrix(1:20, 5)))
##D print(y)
##D 
##D as.R(y)   # Download a SciDB array to R.
## End(Not run)




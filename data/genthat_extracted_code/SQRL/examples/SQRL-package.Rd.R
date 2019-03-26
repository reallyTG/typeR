library(SQRL)


### Name: SQRL-package
### Title: Database Query Interfaces
### Aliases: SQRL-package SQRL
### Keywords: database interface package

### ** Examples

require(SQRL)

# Show (automatic) data sources.
sqrlSources()

## Not run: 
##D # If ratatoskr were one of those sources
##D # (i.e., if a DSN of that name was found),
##D # then a query could be submitted like so:
##D ratatoskr("select messages from vedfolnir ",
##D           "where addressee = 'nidhogg' ",
##D           "limit ", 5)
## End(Not run)

# Define a new data source.
sqrlSource("mysource",
            driver = "MYSQL ODBC 5.3 ANSI Driver",
            server = "localhost",
            user = "<uid>",
            password = "<pwd>")

## Not run: 
##D # Obtain help on usage.
##D mysource("help")
##D 
##D # Submit a query to the new source.
##D mysource("select * from database.table")
##D 
##D # Submit a parameterised query from file.
##D mysource("transactions.sqrl", customerid = 111111)
## End(Not run)




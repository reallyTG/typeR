library(SQRL)


### Name: sqrlSources
### Title: List Data Sources and their Interfaces
### Aliases: sqrlSources
### Keywords: database interface

### ** Examples

# Review defined sources.
sqrlSources()

## Not run: 
##D # Sample sqrlSources() output:
##D 
##D    name interface open                     driver
##D 1 chaos     chaos    N       PostgreSQL ANSI(x64)
##D 2 order      <NA>    N MySQL ODBC 5.3 ANSI Driver
##D 
##D # Here, there are two data sources; 'order' and 'chaos'.
##D # The interface to 'chaos' is a function of the same name.
##D # No interface has yet been defined for 'order' (use of
##D # that name is prevented due to its conflicting with the 
##D # base:order function). Neither source (channel) is open.
## End(Not run)

# Remove all sources.
sqrlSources("remove")

# Reload user DSNs.
sqrlSources("user")




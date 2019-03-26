library(SQRL)


### Name: sqrlInterface
### Title: Creates Data Source Interfaces
### Aliases: sqrlInterface
### Keywords: interface

### ** Examples

# Define a new data source, named 'entropy'.
sqrlSource("entropy", uid = "ludwig", pwd = "<pwd>",
           driver = "{SQL Server Native Client 11.0}",
           server = "Clausius", database = "Gibbs")

# The source comes with an interface of the same name.
sqrlInterface("entropy")
entropy("sources")

# Change the name of the interface function.
sqrlInterface("entropy", "S")

# The name of the source remains unchanged.
sqrlInterface("entropy")
S("sources")

## Not run: 
##D # Submit a query, via the interface.
##D S("select 1")
##D 
##D # Submit a script, via the interface.
##D S("My/SQL/file.sql")
##D 
##D # Submit a parameterised script, via the interface.
##D S("My/SQRL/file.sqrl", month = "April")
## End(Not run)

# Remove the source's interface function.
sqrlInterface("entropy", "remove")

# The source remains, but has no interface.
sqrlInterface("entropy")
sqrlSources()




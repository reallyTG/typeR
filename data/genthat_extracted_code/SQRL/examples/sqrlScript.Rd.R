library(SQRL)


### Name: sqrlScript
### Title: Combined Language Scripts
### Aliases: sqrlScript
### Keywords: file

### ** Examples

# Define a new data source.
sqrlSource("mire", "dsn=Mire")

## Not run: 
##D # Submit a SQL script to the source.
##D mire("my/script.sql")
##D 
##D # Submit a SQRL script, with explicit parameter values.
##D mire("my/parameterised/script.sqrl",
##D       day = Sys.Date(), colour = "'blue'")
## End(Not run)




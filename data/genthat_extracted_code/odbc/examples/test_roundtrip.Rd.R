library(odbc)


### Name: test_roundtrip
### Title: Test round tripping a simple table
### Aliases: test_roundtrip

### ** Examples

## Not run: 
##D test_roundtrip(con)
##D 
##D # exclude a few columns
##D test_roundtrip(con, c("integer", "double"))
##D 
##D # Only test a specific column
##D test_roundtrip(con, "integer", invert = FALSE)
## End(Not run)




library(orgutils)


### Name: readOrg
### Title: Read Org Tables
### Aliases: readOrg

### ** Examples

## Not run: 
##D ## create an Org file with a table and read the table
##D tmp <-
##D "#+TITLE: A Table
##D 
##D Next comes a table.
##D 
##D #+name: test_table
##D | a | b |
##D |---+---|
##D | 1 | 2 |
##D | 3 | 4 |
##D 
##D That was a table.
##D "
##D 
##D fname <- tempfile("testfile", fileext = ".org")
##D writeLines(tmp, fname)
##D 
##D require("org")
##D readOrg(fname, table.name = "test_table")
## End(Not run)




library(healthcareai)


### Name: db_read
### Title: Read from a SQL Server database table
### Aliases: db_read

### ** Examples

## Not run: 
##D my_con <- build_connection_string(server = "HPHI-EDWDEV")
##D con <- DBI::dbConnect(odbc::odbc(), .connection_string = my_con)
##D d <- db_read(con,
##D              "SELECT TOP 10 * FROM [Shared].[Cost].[FacilityAccountCost]")
##D 
##D # Get a reference and collect later
##D ref <- db_read(con,
##D                "SELECT TOP 10 * FROM [Shared].[Cost].[FacilityAccountCost]",
##D                pull_into_memory = FALSE)
##D d <- collect(ref)
## End(Not run)





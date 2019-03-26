library(rpostgis)


### Name: dbVacuum
### Title: Vacuum.
### Aliases: dbVacuum

### ** Examples

## examples use a dummy connection from DBI package
conn<-DBI::ANSI()
dbVacuum(conn, name = c("schema", "table"), full = TRUE, exec = FALSE)




library(rpostgis)


### Name: dbColumn
### Title: Add or remove a column.
### Aliases: dbColumn

### ** Examples

## examples use a dummy connection from DBI package
conn<-DBI::ANSI()
## Add an integer column
dbColumn(conn, name = c("schema", "table"), colname = "field", exec = FALSE)
## Drop a column (with CASCADE)
dbColumn(conn, name = c("schema", "table"), colname = "field", action = "drop",
    cascade = TRUE, exec = FALSE)




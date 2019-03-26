library(rpostgis)


### Name: dbAsDate
### Title: Converts to timestamp.
### Aliases: dbAsDate

### ** Examples

## Example uses a dummy connection from DBI package
conn <- DBI::ANSI()
dbAsDate(conn, name = c("schema", "table"), date = "date", tz = "GMT",
    exec = FALSE)




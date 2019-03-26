library(rpostgis)


### Name: dbDrop
### Title: Drop table/view/schema.
### Aliases: dbDrop

### ** Examples

## examples use a dummy connection from DBI package
conn<-DBI::ANSI()
dbDrop(conn, name = c("schema", "view_name"), type = "view", exec = FALSE)
dbDrop(conn, name = "test_schema", type = "schema", cascade = "TRUE", exec = FALSE)




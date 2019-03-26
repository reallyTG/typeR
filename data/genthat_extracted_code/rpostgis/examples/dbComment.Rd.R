library(rpostgis)


### Name: dbComment
### Title: Comment table/view/schema.
### Aliases: dbComment

### ** Examples

## examples use a dummy connection from DBI package
conn<-DBI::ANSI()
dbComment(conn, name = c("schema", "table"), comment = "Comment on a view.",
    type = "view", exec = FALSE)
dbComment(conn, name = "test_schema", comment = "Comment on a schema.", type = "schema",
    exec = FALSE)




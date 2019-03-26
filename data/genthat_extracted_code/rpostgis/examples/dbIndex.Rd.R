library(rpostgis)


### Name: dbIndex
### Title: Create an index.
### Aliases: dbIndex

### ** Examples

## Examples use a dummy connection from DBI package
conn <- DBI::ANSI()

## GIST index
dbIndex(conn, name = c("sch", "tbl"), colname = "geom", method = "gist",
    exec = FALSE)

## Regular BTREE index on multiple columns
dbIndex(conn, name = c("sch", "tbl"), colname = c("col1", "col2",
    "col3"), exec = FALSE)




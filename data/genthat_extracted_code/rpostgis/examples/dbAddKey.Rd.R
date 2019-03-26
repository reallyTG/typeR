library(rpostgis)


### Name: dbAddKey
### Title: Add key.
### Aliases: dbAddKey

### ** Examples

## Examples use a dummy connection from DBI package
conn <- DBI::ANSI()

## Primary key
dbAddKey(conn, name = c("sch1", "tbl1"), colname = "id1", exec = FALSE)

## Primary key using multiple columns
dbAddKey(conn, name = c("sch1", "tbl1"), colname = c("id1", "id2",
    "id3"), exec = FALSE)

## Foreign key
dbAddKey(conn, name = c("sch1", "tbl1"), colname = "id", type = "foreign",
    reference = c("sch2", "tbl2"), colref = "id", exec = FALSE)

## Foreign key using multiple columns
dbAddKey(conn, name = c("sch1", "tbl1"), colname = c("id1", "id2"),
    type = "foreign", reference = c("sch2", "tbl2"), colref = c("id3",
        "id4"), exec = FALSE)




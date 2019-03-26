library(rpostgis)


### Name: pgMakePts
### Title: Add a POINT or LINESTRING geometry field.
### Aliases: pgMakePts pgMakeStp

### ** Examples

## Examples use a dummy connection from DBI package
conn <- DBI::ANSI()

## Create a new POINT field called 'pts_geom'
pgMakePts(conn, name = c("schema", "table"), colname = "pts_geom",
    x = "longitude", y = "latitude", srid = 4326, exec = FALSE)

## Create a new LINESTRING field called 'stp_geom'
pgMakeStp(conn, name = c("schema", "table"), colname = "stp_geom",
    x = "longitude", y = "latitude", dx = "xdiff", dy = "ydiff",
    srid = 4326, exec = FALSE)




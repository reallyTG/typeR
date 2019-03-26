library(wicket)


### Name: validate_wkt
### Title: Validate WKT objects
### Aliases: validate_wkt

### ** Examples

wkt <- c("POLYGON ((30 10, 40 40, 20 40, 10 20, 30 10))",
        "ARGHLEFLARFDFG",
        "LINESTRING (30 10, 10 90, 40 out of cheese error redo universe from start)")
validate_wkt(wkt)





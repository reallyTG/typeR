library(spatsoc)


### Name: group_polys
### Title: Group Polygons
### Aliases: group_polys

### ** Examples

# Load data.table
library(data.table)

# Read example data
DT <- fread(system.file("extdata", "DT.csv", package = "spatsoc"))

# Cast the character column to POSIXct
DT[, datetime := as.POSIXct(datetime, tz = 'UTC')]

# Proj4 string for example data
utm <- '+proj=utm +zone=36 +south +ellps=WGS84 +datum=WGS84 +units=m +no_defs'

group_polys(DT, area = FALSE, 'mcp', list(percent = 95),
            projection = utm,
            id = 'ID', coords = c('X', 'Y'))

areaDT <- group_polys(DT, area = TRUE, 'mcp', list(percent = 95),
                      projection = utm,
                      id = 'ID', coords = c('X', 'Y'))




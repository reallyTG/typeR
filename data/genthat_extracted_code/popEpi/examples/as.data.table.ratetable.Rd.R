library(popEpi)


### Name: as.data.table.ratetable
### Title: Coerce a 'ratetable' Object to Class 'data.table'
### Aliases: as.data.table.ratetable

### ** Examples

if (requireNamespace("relsurv", quietly = TRUE)) {
  library("data.table")
  data(slopop, package = "relsurv")
  dt <- as.data.table(slopop)
  dt
}




library(irg)


### Name: filter_winter
### Title: Filter winter NDVI
### Aliases: filter_winter

### ** Examples

# Load data.table
library(data.table)

# Read example data
ndvi <- fread(system.file("extdata", "ndvi.csv", package = "irg"))
filter_qa(ndvi, qa = 'SummaryQA', good = c(0, 1))
filter_winter(ndvi, probs = 0.025, limits = c(60L, 300L), doy = 'DayOfYear', id = 'id')




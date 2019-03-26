library(irg)


### Name: filter_roll
### Title: Filter with rolling median
### Aliases: filter_roll

### ** Examples

# Load data.table
library(data.table)

# Read example data
ndvi <- fread(system.file("extdata", "ndvi.csv", package = "irg"))

filter_qa(ndvi, qa = 'SummaryQA', good = c(0, 1))
filter_winter(ndvi, probs = 0.025, limits = c(60L, 300L), doy = 'DayOfYear', id = 'id')
filter_roll(ndvi, window = 3L, id = 'id')




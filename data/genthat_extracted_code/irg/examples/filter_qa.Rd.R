library(irg)


### Name: filter_qa
### Title: Filter with QA Band
### Aliases: filter_qa

### ** Examples

# Load data.table
library(data.table)

# Read example data
ndvi <- fread(system.file("extdata", "ndvi.csv", package = "irg"))

filter_qa(ndvi, qa = 'SummaryQA', good = c(0, 1))




library(irg)


### Name: irg
### Title: IRG
### Aliases: irg

### ** Examples

# Load data.table
library(data.table)

# Read in example data
ndvi <- fread(system.file("extdata", "ndvi.csv", package = "irg"))

# Calculate IRG for each day of the year and individual
out <- irg(ndvi)




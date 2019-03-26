library(ctmm)


### Name: outlie
### Title: Methods to facilitate outlier detection.
### Aliases: outlie

### ** Examples

# Load package and data
library(ctmm)
data(buffalo)

# look for outliers in Cilla
OUT <- outlie(buffalo[[1]])

# look at the distribution of speed esitmates
hist(OUT$speed)




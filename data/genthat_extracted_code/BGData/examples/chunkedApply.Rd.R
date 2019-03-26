library(BGData)


### Name: chunkedApply
### Title: Applies a Function on Each Row or Column of a File-Backed
###   Matrix.
### Aliases: chunkedApply

### ** Examples

# Restrict number of cores to 1 on Windows
if (.Platform$OS.type == "windows") {
    options(mc.cores = 1)
}

# Load example data
bg <- BGData:::loadExample()

# Compute standard deviation of columns
chunkedApply(X = bg@geno, MARGIN = 2, FUN = sd)




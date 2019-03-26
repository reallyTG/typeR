library(mi)


### Name: 02missing_data.frame
### Title: Class "missing_data.frame"
### Aliases: 02missing_data.frame missing_data.frame-class
###   missing_data.frame
### Keywords: classes manip AimedAtUseRs

### ** Examples

# STEP 0: Get data
data(CHAIN, package = "mi")

# STEP 1: Convert to a missing_data.frame
mdf <- missing_data.frame(CHAIN) # warnings about missingness patterns
show(mdf)

# STEP 2: change things
mdf <- change(mdf, y = "log_virus", what = "transformation", to = "identity")

# STEP 3: look deeper
summary(mdf)
hist(mdf)
image(mdf)

# STEP 4: impute
## Not run: 
##D imputations <- mi(mdf)
## End(Not run)

## An example with subsetting on a fully observed variable
data(nlsyV, package = "mi")
mdfs <- missing_data.frame(nlsyV, favor_positive = TRUE, favor_ordered = FALSE, by = "first")
mdfs <- change(mdfs, y = "momed", what = "type", to = "ord")
show(mdfs)





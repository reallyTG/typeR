library(mi)


### Name: 04mi
### Title: Multiple Imputation
### Aliases: 04mi mi mi-class mi-methods
### Keywords: classes regression AimedAtusers

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

# STEP 4: impute
## Not run: 
##D imputations <- mi(mdf)
## End(Not run)




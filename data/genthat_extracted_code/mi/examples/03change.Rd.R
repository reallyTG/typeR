library(mi)


### Name: 03change
### Title: Make Changes to Discretionary Characteristics of Missing
###   Variables
### Aliases: 03change change change-methods change_family
###   change_imputation_method change_link change_model change_size
###   change_transformation change_type
### Keywords: manip AimedAtUseRs

### ** Examples

# STEP 0: GET DATA
data(nlsyV, package = "mi")

# STEP 1: CONVERT IT TO A missing_data.frame
mdf <- missing_data.frame(nlsyV)
show(mdf)

# STEP 2: CHANGE WHATEVER IS WRONG WITH IT
mdf <- change(mdf, y = "momrace", what = "type", to = "un")
mdf <- change(mdf, y = "income", what = "imputation_method", to = "pmm")
mdf <- change(mdf, y = "binary", what = "family", to = binomial(link = "probit"))
mdf <- change(mdf, y = 5, what = "transformation", to = "identity")
show(mdf)




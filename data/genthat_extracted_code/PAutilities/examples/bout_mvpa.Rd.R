library(PAutilities)


### Name: bout_mvpa
### Title: Classify moderate-to-vigorous physical activity in bouts of a
###   specific minimum length
### Aliases: bout_mvpa

### ** Examples

data(ex_data, package = "PAutilities")
ex_data$DateTime <- as.POSIXct(ex_data$DateTime, "UTC")

## No test: 
# Runs with a warning

bout_mvpa(ex_data$METs, "METs")

bout_mvpa(ex_data$METs, "METs", timestamps = ex_data$DateTime)
## End(No test)

# Recommended usage
lapply(split(ex_data, strftime(ex_data$DateTime, "%Y-%m-%d", "UTC")),
function(x) {
bout_mvpa(x$METs, "METs", timestamps = x$DateTime)
})

lapply(split(ex_data, strftime(ex_data$DateTime, "%Y-%m-%d", "UTC")),
function(x) {
bout_mvpa(x$METs,
"METs",
timestamps = x$DateTime,
output_var = "is_MVPA")
})

lapply(split(ex_data, strftime(ex_data$DateTime, "%Y-%m-%d", "UTC")),
function(x) {
bout_mvpa(x$METs,
"METs",
timestamps = x$DateTime,
output_var = "bout_tracker")
})





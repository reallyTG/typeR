library(survutils)


### Name: iter_get_cox_res
### Title: Runs get_cox_res Over a Range of Features
### Aliases: iter_get_cox_res

### ** Examples

library("survival")
endpoint <- "time"
endpoint.code <- "status"

# Run Cox Regression on List of Features
features <- list(c("age", "obstruct"),
                 c("nodes"))

iter_get_cox_res(colon, endpoint, endpoint.code, features,
                  group = "rx")




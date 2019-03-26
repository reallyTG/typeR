library(survutils)


### Name: get_cox_res
### Title: Run Cox Regression on a Single or Multiple Groups of Data
### Aliases: get_cox_res

### ** Examples

library("survival")
endpoint <- "time"
endpoint.code <- "status"

# Run Univariate Cox Regression on Single Feature
features <- "age"
test.df <- get_cox_res(colon, endpoint, endpoint.code, features)

# Run Univariate Cox Regression on Multiple Features
multi.features <- c("age", "obstruct")
get_cox_res(colon, endpoint, endpoint.code, multi.features)

# Run Univariate Cox Regression on Multiple Features For Each rx group
group <- "rx"
get_cox_res(colon, endpoint, endpoint.code, multi.features, group)

# Run Multivariate Cox Regression 
get_cox_res(colon, endpoint, endpoint.code, multi.features)

# Run Multivariate Cox Regression For Each rx Group
get_cox_res(colon, endpoint, endpoint.code, multi.features, group)




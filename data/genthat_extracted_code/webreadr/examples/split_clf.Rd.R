library(webreadr)


### Name: split_clf
### Title: split requests from a CLF-formatted file
### Aliases: split_clf

### ** Examples

# Grab CLF data and split out the request.
data <- read_combined(system.file("extdata/combined_log.clf", package = "webreadr"))
requests <- split_clf(data$request)

# An example using S3 files
s3_data <- read_s3(system.file("extdata/s3.log", package = "webreadr"))
s3_requests <- split_clf(s3_data$uri)





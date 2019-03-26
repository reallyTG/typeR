library(webreadr)


### Name: split_squid
### Title: split the "status_code" field in a Squid-formatted dataset.
### Aliases: split_squid

### ** Examples

#Read in an example Squid file provided with the webtools package, then split out the codes
data <- read_squid(system.file("extdata/log.squid", package = "webreadr"))
statuses <- split_squid(data$status_code)





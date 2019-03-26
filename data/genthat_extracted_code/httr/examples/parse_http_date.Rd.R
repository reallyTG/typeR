library(httr)


### Name: parse_http_date
### Title: Parse and print http dates.
### Aliases: parse_http_date http_date

### ** Examples

parse_http_date("Sun, 06 Nov 1994 08:49:37 GMT")
parse_http_date("Sunday, 06-Nov-94 08:49:37 GMT")
parse_http_date("Sun Nov  6 08:49:37 1994")

http_date(Sys.time())




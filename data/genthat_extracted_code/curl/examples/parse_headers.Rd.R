library(curl)


### Name: parse_headers
### Title: Parse response headers
### Aliases: parse_headers parse_headers_list

### ** Examples

req <- curl_fetch_memory("https://httpbin.org/redirect/3")
parse_headers(req$headers)
parse_headers(req$headers, multiple = TRUE)

# Parse into named list
parse_headers_list(req$headers)




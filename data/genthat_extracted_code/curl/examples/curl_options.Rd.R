library(curl)


### Name: curl_options
### Title: List curl version and options.
### Aliases: curl_options curl_version curl_symbols
### Keywords: datasets

### ** Examples

# Available options
curl_options()

# List proxy options
curl_options("proxy")

# Symbol table
head(curl_symbols)
# Curl/ssl version info
curl_version()




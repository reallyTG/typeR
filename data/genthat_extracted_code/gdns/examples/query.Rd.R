library(gdns)


### Name: query
### Title: Perform DNS over HTTPS queries using Google
### Aliases: query

### ** Examples

query("rud.is")
query("example.com", "255") # ANY query
query("microsoft.com", "MX")
query("google-public-dns-a.google.com", "TXT")
query("apple.com")
query("17.142.160.59", "PTR")




library(urltools)


### Name: tld_extract
### Title: Extract TLDs
### Aliases: tld_extract

### ** Examples

# Using the inbuilt dataset
domains <- domain("https://en.wikipedia.org/wiki/Main_Page")
tld_extract(domains)

# Using a refreshed one
tld_extract(domains, tld_refresh())





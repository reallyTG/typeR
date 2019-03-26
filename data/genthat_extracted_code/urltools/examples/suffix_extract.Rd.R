library(urltools)


### Name: suffix_extract
### Title: extract the suffix from domain names
### Aliases: suffix_extract

### ** Examples


# Using url_parse
domain_name <- url_parse("http://en.wikipedia.org")$domain
suffix_extract(domain_name)

# Using domain()
domain_name <- domain("http://en.wikipedia.org")
suffix_extract(domain_name)

#Relying on a fresh version of the suffix dataset
suffix_extract(domain("http://en.wikipedia.org"), suffix_refresh())





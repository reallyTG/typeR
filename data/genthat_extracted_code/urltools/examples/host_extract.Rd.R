library(urltools)


### Name: host_extract
### Title: Extract hosts
### Aliases: host_extract

### ** Examples

# With subdomains
has_subdomain <- domain("https://en.wikipedia.org/wiki/Main_Page")
host_extract(has_subdomain)

# Without
no_subdomain <- domain("https://ironholds.org/projects/r_shiny/")
host_extract(no_subdomain)




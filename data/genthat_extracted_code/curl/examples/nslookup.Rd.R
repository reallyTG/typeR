library(curl)


### Name: nslookup
### Title: Lookup a hostname
### Aliases: nslookup has_internet

### ** Examples

# Should always work if we are online
nslookup("www.r-project.org")

# If your OS supports IPv6
nslookup("ipv6.test-ipv6.com", ipv4_only = FALSE, error = FALSE)




library(Rwhois)


### Name: Rwhois
### Title: WHOIS server querying
### Aliases: Rwhois Rwhois::whois_query whois_query
### Keywords: Rwhois whois

### ** Examples

# Grab WHOIS data for a hostname
whois_query("bcable.net")

# Grab WHOIS data for an IP
whois_query("1.1.1.1")

# Grab WHOIS data for a hostname from a different whois server
whois_query("bcable.net", server="whois.verisign-grs.com")

# Grab multiple vectorized results
domains <- c("bcable.net", "google.com")
whois_query(domains)




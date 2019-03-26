library(iptools)


### Name: hostname_to_ip
### Title: Returns the IP addresses associated with a hostname.
### Aliases: hostname_to_ip

### ** Examples


## Not run: 
##D # One hostname
##D hostname_to_ip("dds.ec")
##D ## [1] "162.243.111.4"
##D 
##D # Multiple hostnames
##D hostname_to_ip(c("dds.ec","ironholds.org"))
##D #[[1]]
##D #[1] "162.243.111.4"
##D #[[2]]
##D #[1] "104.131.2.226"
## End(Not run)




library(iptools)


### Name: range_boundaries_to_cidr
### Title: Convert a start+end IP address range pair to representative CIDR
###   blocks
### Aliases: range_boundaries_to_cidr

### ** Examples

range_boundaries_to_cidr(
 ip_to_numeric("192.100.176.0"),
 ip_to_numeric("192.100.179.255")
)
## [1] "192.100.176.0/22"




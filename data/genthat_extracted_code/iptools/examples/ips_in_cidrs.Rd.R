library(iptools)


### Name: ips_in_cidrs
### Title: Determine if a vector if IPv4 addresses are in a vector of CIDRs
### Aliases: ips_in_cidrs

### ** Examples

ips_in_cidrs(
  c("4.3.2.1", "1.2.3.4", "1.20.113.10", "5.190.145.5"),
  c("5.190.144.0/21", "1.20.113.0/24")
)




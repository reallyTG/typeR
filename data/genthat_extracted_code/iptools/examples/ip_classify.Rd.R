library(iptools)


### Name: ip_classify
### Title: Identify whether an IP address is IPv4 or IPv6
### Aliases: ip_classify

### ** Examples


#IPv4
ip_classify("173.194.123.100")
#[1] "IPv4"

#IPv6
ip_classify("2607:f8b0:4006:80b::1004")
#[1] "IPv6"

#Invalid
ip_classify("East Coast Twitter is Best Twitter")
#[1] NA





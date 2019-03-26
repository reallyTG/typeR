library(iptools)


### Name: ip_to_numeric
### Title: convert between numeric and dotted-decimal IPv4 forms.
### Aliases: ip_to_numeric numeric_to_ip

### ** Examples

#Convert your local, internal IP to its numeric representation.
ip_to_numeric("192.168.0.1")
#[1] 3232235521

#And back
numeric_to_ip(3232235521)
#[1] 192.168.0.1"




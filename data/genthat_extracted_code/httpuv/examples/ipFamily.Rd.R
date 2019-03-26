library(httpuv)


### Name: ipFamily
### Title: Check whether an address is IPv4 or IPv6
### Aliases: ipFamily

### ** Examples

ipFamily("127.0.0.1")   # 4
ipFamily("500.0.0.500") # -1
ipFamily("500.0.0.500") # -1

ipFamily("::")          # 6
ipFamily("::1")         # 6
ipFamily("fe80::1ff:fe23:4567:890a") # 6




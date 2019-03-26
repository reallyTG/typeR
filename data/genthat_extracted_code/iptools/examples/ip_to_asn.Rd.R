library(iptools)


### Name: ip_to_asn
### Title: Match IP addresses to autonomous systems
### Aliases: ip_to_asn

### ** Examples

tbl <- asn_table_to_trie(system.file("test", "rib.tst.gz", package="iptools"))
ip_to_asn(tbl, "5.192.0.1")




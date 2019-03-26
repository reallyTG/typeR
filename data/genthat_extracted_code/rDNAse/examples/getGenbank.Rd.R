library(rDNAse)


### Name: getGenbank
### Title: Get DNA/RNA Sequences from Genbank by GI ID
### Aliases: getGenbank
### Keywords: Genbank

### ** Examples

## No test: 
# Network latency may slow down this example
# Only test this when your connection is fast enough
require(RCurl)

ids = c(2, 11)
getGenbank(ids)
## End(No test)




library(binneR)


### Name: binParameters
### Title: binParameters
### Aliases: binParameters

### ** Examples

p <- binParameters(scans = 6:17,nCores = 2,clusterType = 'PSOCK')

## Example using multiple overlapping scan ranges
p <- binParameters(scans = 6:17,sranges = list(c(55,280),c(270,1200)))





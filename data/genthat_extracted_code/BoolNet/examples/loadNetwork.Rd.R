library(BoolNet)


### Name: loadNetwork
### Title: Load a Boolean network from a file
### Aliases: loadNetwork
### Keywords: Boolean network probabilistic Boolean network PBN file logic
###   parse

### ** Examples

# write example network to file
sink("testNet.bn")
cat("targets, factors\n")
cat("Gene1, !Gene2 | !Gene3\n")
cat("Gene2, Gene3 & Gene4\n")
cat("Gene3, Gene2 & !Gene1\n")
cat("Gene4, 1\n")
sink()

# read file
net <- loadNetwork("testNet.bn")
print(net)




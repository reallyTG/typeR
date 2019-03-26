library(networkD3)


### Name: simpleNetwork
### Title: Function for creating simple D3 JavaScript force directed
###   network graphs.
### Aliases: simpleNetwork

### ** Examples

# Fake data
Source <- c("A", "A", "A", "A", "B", "B", "C", "C", "D")
Target <- c("B", "C", "D", "J", "E", "F", "G", "H", "I")
NetworkData <- data.frame(Source, Target)

# Create graph
simpleNetwork(NetworkData)
simpleNetwork(NetworkData, fontFamily = "sans-serif")





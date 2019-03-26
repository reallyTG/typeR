library(d3Network)


### Name: d3SimpleNetwork
### Title: Function for creating simple D3 JavaScript force directed
###   network graphs.
### Aliases: d3SimpleNetwork

### ** Examples

# Fake data
Source <- c("A", "A", "A", "A", "B", "B", "C", "C", "D")
Target <- c("B", "C", "D", "J", "E", "F", "G", "H", "I")
NetworkData <- data.frame(Source, Target)

# Create graph
d3SimpleNetwork(NetworkData, height = 300, width = 700,
                 fontsize = 15)




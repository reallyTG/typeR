library(ioanalysis)


### Name: key.sector
### Title: Impact Analysis via Backward and Forward Linkages
### Aliases: key.sector

### ** Examples

data(toy.IO)
class(toy.IO)
key1 <- key.sector(toy.IO)
key1$Narnia

data(toy.ES)
class(toy.ES)
key2 <- key.sector(toy.IO, toy.ES)
key2

# A more detailed example
# Using critical value of 2 because this is randomly generated data and better 
# illustrates functionality
key3 <- key.sector(toy.IO, intra.inter = TRUE, type = c("direct"), crit = 2)
key3

key4 <- key.sector(toy.IO, regions = c(1:2), sectors = c(1:3,5))
key4




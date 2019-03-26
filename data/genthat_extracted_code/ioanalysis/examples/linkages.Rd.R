library(ioanalysis)


### Name: linkages
### Title: Backward and Forward Linkages
### Aliases: linkages

### ** Examples

data(toy.IO)
class(toy.IO)
link1 <- linkages(toy.IO)
link1$Hogwarts

data(toy.ES)
class(toy.ES)
link2 <- linkages(toy.IO, toy.ES)
link2

# More detailed
link3 <- linkages(toy.IO, regions = "Narnia", sectors = c("Wii","Pizza"), 
                  type = c("total", "direct"), normalize = FALSE, intra.inter = TRUE)
link3

link4 <- linkages(toy.IO, regions = 1:2, sectors = c(1:3,5))
link4





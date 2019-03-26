library(ioanalysis)


### Name: extraction
### Title: Hypothetical Extraction
### Aliases: extraction

### ** Examples

data(toy.IO)
class(toy.IO)
E1 <- extraction(toy.IO)

# Using an EasySelect object
data(toy.IO)
class(toy.IO)
E2 <- extraction(toy.IO, toy.ES)
E2$Hogwarts

# Using more options
E3 <- extraction(toy.IO, regions = c(1,2), sectors = c("Wii", "Minions"), 
                 type = c("backward", "backward.total"), aggregate = TRUE)
E3$Hogwarts$backward.total

# Multiple regions and types
E4 <- extraction(toy.IO, type = c("forward","forward.total"), normalize = TRUE)
E4$Hogwarts$forward.total




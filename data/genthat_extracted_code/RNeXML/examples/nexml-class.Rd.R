library(RNeXML)


### Name: nexml-class
### Title: Class representing a NeXML document
### Aliases: nexml-class nexml

### ** Examples

nex <- nexml() # a nexml object with no further content
nex <- new("nexml") # accomplishes the same thing
nex@generator
length(nex@trees)

data(bird.orders)
nex <- as(bird.orders, "nexml")
summary(nex)
length(nex@trees)




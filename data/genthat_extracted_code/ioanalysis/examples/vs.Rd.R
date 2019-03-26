library(ioanalysis)


### Name: vs
### Title: Vertical Specialization
### Aliases: vs

### ** Examples

data(toy.IO)
class(toy.IO)
(vs1 <- vs(toy.IO, regions = "all"))
vs1$Hogwarts
sum(vs1$Hogwarts)

data(toy.ES)
class(toy.ES)
vs2 <- vs(toy.IO, toy.ES)
vs2




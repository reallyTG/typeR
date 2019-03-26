library(ioanalysis)


### Name: output.decomposition
### Title: Decomposition of Output Changes
### Aliases: output.decomposition

### ** Examples

data(toy.IO)
data(toy.IO2)
class(toy.IO)
class(toy.IO) == class(toy.IO2)

OD1 <- output.decomposition(toy.IO, toy.IO2)
OD1$Hogwarts

OD2 <- output.decomposition(toy.IO, toy.IO2, origin = "external", 
                            cause = c("finaldemand","leontief"))
OD2




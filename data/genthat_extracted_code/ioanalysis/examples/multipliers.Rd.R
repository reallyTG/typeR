library(ioanalysis)


### Name: multipliers
### Title: Multiplier Analysis
### Aliases: multipliers

### ** Examples

data(toy.IO)
class(toy.IO)
M1 <- multipliers(toy.IO, multipliers = "income", wage.row = 1)
M2 <- multipliers(toy.IO, multipliers = "employment.closed", employ.closed.row = "Minions")

data(toy.ES)
class(toy.ES)
M3 <- multipliers(toy.IO, toy.ES, multipliers = c("input", "output"))




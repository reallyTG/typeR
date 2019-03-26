library(spnn)


### Name: pnn.guess
### Title: pnn.guess
### Aliases: pnn.guess

### ** Examples

library(spnn)
data(norms)

pnn <- pnn.learn(norms)
pnn.guess(nn = pnn, X = c(1,2))




library(pnn)


### Name: guess
### Title: Guess
### Aliases: guess

### ** Examples

library(pnn)
data(norms)
pnn <- learn(norms)
pnn <- smooth(pnn, sigma=0.8)
guess(pnn, c(1,1))
guess(pnn, c(1,1))$category
guess(pnn, c(1,1))$probabilities
guess(pnn, c(2,1))
guess(pnn, c(1.5,1))




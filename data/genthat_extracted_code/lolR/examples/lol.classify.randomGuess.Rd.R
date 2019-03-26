library(lolR)


### Name: lol.classify.randomGuess
### Title: Randomly Guessing Classifier Training
### Aliases: lol.classify.randomGuess

### ** Examples

library(lolR)
data <- lol.sims.rtrunk(n=200, d=30)  # 200 examples of 30 dimensions
X <- data$X; Y <- data$Y
model <- lol.classify.randomGuess(X, Y)




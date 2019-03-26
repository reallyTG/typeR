library(clickstream)


### Name: randomClickstreams
### Title: Generates a List of Clickstreams
### Aliases: randomClickstreams

### ** Examples


# generate a simple list of click streams
states <- c("a", "b", "c")
startProbabilities <- c(0.2, 0.5, 0.3)
transitionMatrix <- matrix(c(0, 0.4, 0.6, 0.3, 0.1, 0.6, 0.2, 0.8, 0), nrow = 3)
cls <- randomClickstreams(states, startProbabilities, transitionMatrix, meanLength = 5, n = 10)
print(cls)





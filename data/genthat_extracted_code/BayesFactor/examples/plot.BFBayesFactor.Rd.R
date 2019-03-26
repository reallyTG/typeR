library(BayesFactor)


### Name: plot.BFBayesFactor
### Title: Plot a Bayes factor object
### Aliases: plot.BFBayesFactor

### ** Examples

data(puzzles)

bfs = anovaBF(RT ~ shape*color + ID, data = puzzles, whichRandom="ID", progress=FALSE)
plot(bfs)




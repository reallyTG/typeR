library(BayesFactor)


### Name: plot.BFBayesFactorTop
### Title: Plot a Bayes factor top-down object
### Aliases: plot.BFBayesFactorTop

### ** Examples

data(puzzles)

bfs = anovaBF(RT ~ shape*color + ID, data = puzzles, whichRandom="ID",
        whichModels='top', progress=FALSE)
plot(bfs)




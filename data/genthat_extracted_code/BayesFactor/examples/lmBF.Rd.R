library(BayesFactor)


### Name: lmBF
### Title: Function to compute Bayes factors for specific linear models
### Aliases: lmBF
### Keywords: htest

### ** Examples

## Puzzles data; see ?puzzles for details
data(puzzles)
## Bayes factor of full model against null
bfFull = lmBF(RT ~ shape + color + shape:color + ID, data = puzzles, whichRandom = "ID")

## Bayes factor of main effects only against null
bfMain = lmBF(RT ~ shape + color + ID, data = puzzles, whichRandom = "ID")

## Compare the main-effects only model to the full model
bfMain / bfFull

## sample from the posterior of the full model
samples = lmBF(RT ~ shape + color + shape:color + ID,
           data = puzzles, whichRandom = "ID", posterior = TRUE,
           iterations = 1000)

## Aother way to sample from the posterior of the full model
samples2 = posterior(bfFull, iterations = 1000)




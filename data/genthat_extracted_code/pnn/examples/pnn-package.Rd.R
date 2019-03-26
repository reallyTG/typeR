library(pnn)


### Name: pnn-package
### Title: PNN
### Aliases: pnn pnn-package
### Keywords: Neural Probability network,

### ** Examples

library(pnn)
data(norms)

# The long way
pnn <- learn(norms)
pnn <- smooth(pnn, sigma=0.9)
pnn$sigma
## Not run: pnn <- perf(pnn) # Optional
## Not run: pnn$success_rate # Optional
guess(pnn, c(1,1))
guess(pnn, c(2,1))
guess(pnn, c(1.5,1))

# The short way
guess(smooth(learn(norms), sigma=0.8), c(1,1))
guess(smooth(learn(norms), sigma=0.8), c(2,1))
guess(smooth(learn(norms), sigma=0.8), c(1.5,1))

# Demonstrations
## Not run: demo("norms-trainingset", "pnn")
## Not run: demo("small-trainingset", "pnn")




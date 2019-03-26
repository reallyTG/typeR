library(pnn)


### Name: smooth
### Title: Smooth
### Aliases: smooth

### ** Examples

library(pnn)
data(norms)

# Search the best value
pnn <- learn(norms)
## Not run: pnn <- smooth(pnn)
## Not run: pnn$sigma

# Or set the value
pnn <- smooth(pnn, sigma=0.8)
pnn$sigma




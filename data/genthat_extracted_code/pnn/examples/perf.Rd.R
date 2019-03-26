library(pnn)


### Name: perf
### Title: Perf
### Aliases: perf

### ** Examples

library(pnn)
data(norms)
pnn <- learn(norms)
pnn <- smooth(pnn, sigma=0.8)
pnn <- perf(pnn)
pnn$observed
pnn$guessed
pnn$success
pnn$fails
pnn$success_rate
pnn$bic




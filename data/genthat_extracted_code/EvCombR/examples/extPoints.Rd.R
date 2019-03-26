library(EvCombR)


### Name: extPoints
### Title: Extreme Points of a Credal Set
### Aliases: extPoints

### ** Examples

# state space
stateSpace <- c("a", "b", "c")

# construct credal set
c <- credal(c(0.1, 0.1, 0.1), c(0.8, 0.8, 0.8), stateSpace)

# obtain extrem points
eMat <- extPoints(c)





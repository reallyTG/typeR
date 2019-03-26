library(Benchmarking)


### Name: charnes1981
### Title: Data: Charnes et al. (1981): Program follow through
### Aliases: charnes1981
### Keywords: datasets

### ** Examples

data(charnes1981)
x <- with(charnes1981, cbind(x1,x2,x3,x4,x5))
y <- with(charnes1981, cbind(y1,y2,y3))

# Farrell inpout efficiency; vrs technology
e <- dea(x,y)
# The number of times each peer is a peer
np <- get.number.peers(e) 
# Peers that are peers for more than 20 schools, and the number of
# times they are peers
np[which(np[,2]>20),]

# Plot first input against first output and emphasize the peers that
# are peers for more than 20 schools in the model with five inputs and
# three outputs
inp <- np[which(np[,2]>20),1]
dea.plot(x[,1],y[,1])
points(x[inp,1], y[inp,1], pch=16, col="red")




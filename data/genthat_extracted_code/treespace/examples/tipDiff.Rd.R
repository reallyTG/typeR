library(treespace)


### Name: tipDiff
### Title: Find tip position differences
### Aliases: tipDiff

### ** Examples

## simple example on trees with five tips:
tr1 <- read.tree(text="((A:1,B:1):1,((C:1,D:1):1,E:1):1):1;")
tr2 <- read.tree(text="((A:1,B:1):1,(C:1,(D:1,E:1):1):1):1;")
tipDiff(tr1,tr2)

## example on larger woodmice trees
data(woodmiceTrees)
tipDiff(woodmiceTrees[[1]],woodmiceTrees[[2]])





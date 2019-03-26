library(qgraph)


### Name: qgraph.animate
### Title: Animate a growing network
### Aliases: qgraph.animate
### Keywords: ~kwd1 ~kwd2

### ** Examples

## Not run: 
##D 
##D ## For these examples, first generate a scale free network using preferential attachment:
##D 
##D # Number of nodes:
##D n <- 100
##D # Empty vector with Degrees:
##D Degs <- rep(0, n)
##D # Empty Edgelist:
##D E <- matrix(NA, n - 1, 2)
##D # Add and connect nodes 1 and 2:
##D E[1, ] <- 1:2
##D Degs[1:2] <- 1
##D # For each node, add it with probability proportional to degree:
##D for (i in 2:(n - 1))
##D {
##D E[i, 2] <- i + 1
##D con <- sample(1:i, 1, prob = Degs[1:i]/sum(Degs[1:i]),i)
##D Degs[c(con,i+1)] <- Degs[c(con,i+1)] + 1
##D E[i, 1] <- con
##D }
##D 
##D # Because this is an edgelist we need a function to convert this to an adjacency matrix:
##D E2adj <- function(E,n)
##D {
##D   adj <- matrix(0,n,n)
##D   for (i in 1:nrow(E))
##D   {
##D       adj[E[i,1],E[i,2]]  <- 1
##D   }
##D   adj <- adj + t(adj)
##D   return(adj)
##D }
##D 
##D 
##D 
##D ### EXAMPLE 1: Animation of construction algorithm: ###
##D adjs <- lapply(1:nrow(E),function(i) E2adj(E[1:i,,drop=FALSE],n))
##D qgraph.animate(adjs,color="black",labels=FALSE,sleep=0.1, smooth = FALSE)
##D rm(adjs)
##D 
##D ### EXAMPLE 2: Add nodes by final degree: ###
##D adj <- E2adj(E,n)
##D qgraph.animate(E2adj(E,n),color="black",labels=FALSE,constraint=100,sleep=0.1)
##D 
##D ### EXAMPLE 3: Changing edge weights: ###
##D adjW <- adj*rnorm(n^2)
##D adjW <- (adjW + t(adjW))/2
##D adjs <- list(adjW)
##D for (i in 2:100)
##D {
##D   adjW <- adj*rnorm(n^2)
##D   adjW <- (adjW + t(adjW))/2
##D   adjs[[i]] <- adjs[[i-1]] + adjW
##D }
##D qgraph.animate(adjs,color="black",labels=FALSE,constraint=100,sleep=0.1)
##D 
##D 
## End(Not run)




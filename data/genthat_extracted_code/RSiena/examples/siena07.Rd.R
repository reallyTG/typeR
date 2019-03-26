library(RSiena)


### Name: siena07
### Title: Function to estimate parameters in a Siena model
### Aliases: siena07
### Keywords: models

### ** Examples

myalgorithm <- sienaAlgorithmCreate(nsub=2, n3=100, seed=123)
# nsub=2 and n3=100 is used here for having a brief computation, not for practice.
mynet1 <- sienaDependent(array(c(tmp3, tmp4), dim=c(32, 32, 2)))
mydata <- sienaDataCreate(mynet1)
myeff <- getEffects(mydata)
ans <- siena07(myalgorithm, data=mydata, effects=myeff, batch=TRUE)

# or for non-conditional estimation --------------------------------------------
## Not run: 
##D model <- sienaModelCreate(nsub=2, n3=100, cond=FALSE, seed=123)
##D ans <- siena07(myalgorithm, data=mydata, effects=myeff, batch=TRUE)
##D         
## End(Not run)

# or if a previous "on track" result ans was obtained --------------------------
## Not run: 
##D ans1 <- siena07(myalgorithm, data=mydata, effects=myeff, prevAns=ans, batch=TRUE)
##D          
## End(Not run)

# Running in multiple processors -----------------------------------------------
## Not run: 
##D # Not tested because dependent on presence of processors
##D # Find out how many processors there are
##D library(parallel)
##D (n.clus <- detectCores() - 1)
##D # number of cores; 1 is subtracted to keep time for other processes
##D ans2 <- siena07(myalgorithm, data=mydata, effects=myeff, batch=TRUE,
##D                 useCluster=TRUE, nbrNodes=n.clus, initC=TRUE)
##D 
##D # Suppose 8 processors are going to be used.
##D # Loading the parallel package and creating a cluster
##D # with 8 processors (this should be equivalent)
##D 
##D library(parallel)
##D cl <- makeCluster(n.clus)
##D 
##D ans3 <- siena07(myalgorithm, data=mydata, effects=myeff, batch=TRUE, cl = cl)
##D 
##D # Notice that now -siena07- perhaps won't stop the cluster for you.
##D # stopCluster(cl)
##D 
##D # You can create even more complex clusters using several computers. In this
##D # example we are creating a cluster with 3*8 = 24 processors on three
##D # different machines.
##D cl <- makePSOCKcluster(
##D     rep(c('localhost', 'machine2.website.com' , 'machine3.website.com'), 8),
##D     user='myusername', rshcmd='ssh -p PORTNUMBER')
##D 
##D ans4 <- siena07(myalgorithm, data=mydata, effects=myeff, batch=TRUE, cl = cl)
##D stopCluster(cl)
## End(Not run)
# Accessing simulated networks for ML ------------------------------------------
# The following is an example for accessing the simulated networks for ML,
# which makes sense only if there are some missing tie variables;
# observed tie variables are identically simulated at the moment of observation,
# missing tie variable are imputed in a model-based way.
mat1 <- matrix(c(0,0,1,1,
                 1,0,0,0,
                 0,0,0,1,
                 0,1,0,0),4,4, byrow=TRUE)
mat2 <- matrix(c(0,1,1,1,
                 1,0,0,0,
                 0,0,0,1,
                 0,0,1,0),4,4, byrow=TRUE)
mat3 <- matrix(c(0,1,0,1,
                 1,0,0,0,
                 0,0,0,0,
                 NA,1,1,0),4,4, byrow=TRUE)
mats <- array(c(mat1,mat2,mat3), dim=c(4,4,3))
net <- sienaDependent(mats, allowOnly=FALSE)
sdat <- sienaDataCreate(net)
alg <- sienaAlgorithmCreate(maxlike=TRUE, nsub=3, n3=100, seed=1234)
effs <- getEffects(sdat)
## Not run: 
##D (ans <- siena07(alg, data=sdat, effects=effs, returnDeps=TRUE, batch=TRUE))
##D # See manual Section 9.1 for information about the following functions
##D edges.to.adj <- function(x,n){
##D # create empty adjacency matrix
##D     adj <- matrix(0, n, n)
##D # put edge values in desired places
##D     adj[x[, 1:2]] <- x[, 3]
##D     adj
##D }
##D the.edge <- function(x,n,h,k){
##D     edges.to.adj(x,n)[h,k]
##D }
##D # Now show the results
##D n <- 4
##D ego <- rep.int(1:n,n)
##D alter <- rep(1:n, each=n)
##D ones <- sapply(1:n^2, function(i)
##D     {mean(sapply(ans$sims, function(x){the.edge(x[[1]][[2]],n,ego[i],alter[i])}))})
##D cbind(ego,alter,ones)
##D matrix(ones,n,n)
##D     
## End(Not run)




library(multiway)


### Name: indscal
### Title: Individual Differences Scaling
### Aliases: indscal
### Keywords: models multivariate

### ** Examples

##########   array example   ##########

# create random data array with INDSCAL structure
set.seed(3)
mydim <- c(50,5,10)
nf <- 2
X <- array(0, dim = c(rep(mydim[2],2), mydim[3]))
for(k in 1:mydim[3]) {
  X[,,k] <- as.matrix(dist(t(matrix(rnorm(prod(mydim[1:2])), mydim[1], mydim[2]))))
}

# fit INDSCAL model
imod <- indscal(X, nfac = nf, nstart = 1)
imod

# check solution
Xhat <- fitted(imod)
sum((array(apply(X,3,ed2sp), dim = dim(X)) - Xhat)^2)
imod$SSE

# reorder and resign factors
imod$B[1:4,]
imod <- reorder(imod, 2:1)
imod$B[1:4,]
imod <- resign(imod, newsign = c(1,-1))
imod$B[1:4,]
sum((array(apply(X,3,ed2sp), dim = dim(X)) - Xhat)^2)
imod$SSE

# rescale factors
colSums(imod$B^2)
colSums(imod$C^2)
imod <- rescale(imod, mode = "C")
colSums(imod$B^2)
colSums(imod$C^2)
sum((array(apply(X,3,ed2sp), dim = dim(X)) - Xhat)^2)
imod$SSE


##########   list example   ##########

# create random data array with INDSCAL structure
set.seed(4)
mydim <- c(100, 8, 20)
nf <- 3
X <- vector("list", mydim[3])
for(k in 1:mydim[3]) {
  X[[k]] <- dist(t(matrix(rnorm(prod(mydim[1:2])), mydim[1], mydim[2])))
}

# fit INDSCAL model (orthogonal B, non-negative C)
imod <- indscal(X, nfac = nf, nstart = 1, const = c("orthog", "nonneg"))
imod

# check solution
Xhat <- fitted(imod)
sum((array(unlist(lapply(X,ed2sp)), dim = mydim[c(2,2,3)]) - Xhat)^2)
imod$SSE
crossprod(imod$B)


## Not run: 
##D 
##D ##########   parallel computation   ##########
##D 
##D # create random data array with INDSCAL structure
##D set.seed(3)
##D mydim <- c(50,5,10)
##D nf <- 2
##D X <- array(0,dim=c(rep(mydim[2],2), mydim[3]))
##D for(k in 1:mydim[3]) {
##D   X[,,k] <- as.matrix(dist(t(matrix(rnorm(prod(mydim[1:2])), mydim[1], mydim[2]))))
##D }
##D 
##D # fit INDSCAL model (10 random starts -- sequential computation)
##D set.seed(1)
##D system.time({imod <- indscal(X, nfac = nf)})
##D imod
##D 
##D # fit INDSCAL model (10 random starts -- parallel computation)
##D cl <- makeCluster(detectCores())
##D ce <- clusterEvalQ(cl,library(multiway))
##D clusterSetRNGStream(cl, 1)
##D system.time({imod <- indscal(X, nfac = nf, parallel = TRUE, cl = cl)})
##D imod
##D stopCluster(cl)
## End(Not run)





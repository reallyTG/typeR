library(NPflow)


### Name: DPMGibbsN_parallel
### Title: Slice Sampling of the Dirichlet Process Mixture Model with a
###   prior on alpha
### Aliases: DPMGibbsN_parallel

### ** Examples


# Scaling up: ----
rm(list=ls())
#Number of data
n <- 2000
set.seed(1234)

# Sample data
d <- 3
nclust <- 5
m <- matrix(nrow=d, ncol=nclust, runif(d*nclust)*8)
# p: cluster probabilities
p <- runif(nclust)
p <- p/sum(p)

# Covariance matrix of the clusters
sdev <- array(dim=c(d, d, nclust))
for (j in 1:nclust){
    sdev[, ,j] <- matrix(NA, nrow=d, ncol=d)
    diag(sdev[, ,j]) <- abs(rnorm(n=d, mean=0.3, sd=0.1))
    sdev[, ,j][lower.tri(sdev[, ,j], diag = FALSE)] <- rnorm(n=d*(d-1)/2,
    mean=0, sd=0.05)
    sdev[, ,j][upper.tri(sdev[, ,j], diag = FALSE)] <- (sdev[, ,j][
                                                        lower.tri(sdev[, ,j], diag = FALSE)])
}
c <- rep(0,n)
z <- matrix(0, nrow=d, ncol=n)
for(k in 1:n){
    c[k] = which(rmultinom(n=1, size=1, prob=p)!=0)
    z[,k] <- m[, c[k]] + sdev[, , c[k]]%*%matrix(rnorm(d, mean = 0, sd = 1), nrow=d, ncol=1)
    #cat(k, "/", n, " observations simulated\n", sep="")
}

# hyperprior on the Scale parameter of DPM
a <- 0.001
b <- 0.001

# Number of iterations
N <- 25

# do some plots
doPlot <- TRUE

# Set parameters of G0
hyperG0 <- list()
hyperG0[["mu"]] <- rep(0, d)
hyperG0[["kappa"]] <- 0.01
hyperG0[["nu"]] <- d + 2
hyperG0[["lambda"]] <- diag(d)/10


nbclust_init <- 30

## Not run: 
##D  library(doParallel)
##D  MCMCsample <- DPMGibbsN_parallel(Ncpus=2, type_connec="FORK", z, hyperG0, a, b, N=1000, doPlot, 
##D                                   nbclust_init, plotevery=100, gg.add=list(theme_bw(),
##D                                   guides(shape=guide_legend(override.aes = list(fill="grey45")))),
##D                                   diagVar=FALSE)
## End(Not run)






library(NPflow)


### Name: DPMpost
### Title: Posterior estimation for Dirichlet process mixture of
###   multivariate (potentially skew) distibutions models
### Aliases: DPMpost

### ** Examples

#rm(list=ls())
set.seed(123)

# Exemple in 2 dimensions with skew-t distributions

# Generate data:
n <- 2000 # number of data points
d <- 2 # dimensions
ncl <- 4 # number of true clusters
sdev <- array(dim=c(d,d,ncl))
xi <- matrix(nrow=d, ncol=ncl, c(-1.5, 1.5, 1.5, 1.5, 2, -2.5, -2.5, -3))
psi <- matrix(nrow=d, ncol=4, c(0.3, -0.7, -0.8, 0, 0.3, -0.7, 0.2, 0.9))
nu <- c(100,25,8,5)
proba <- c(0.15, 0.05, 0.5, 0.3) # cluster frequencies
sdev[, ,1] <- matrix(nrow=d, ncol=d, c(0.3, 0, 0, 0.3))
sdev[, ,2] <- matrix(nrow=d, ncol=d, c(0.1, 0, 0, 0.3))
sdev[, ,3] <- matrix(nrow=d, ncol=d, c(0.3, 0, 0, 0.2))
sdev[, ,4] <- .3*diag(2)
c <- rep(0,n)
w <- rep(1,n)
z <- matrix(0, nrow=d, ncol=n)
for(k in 1:n){
 c[k] = which(rmultinom(n=1, size=1, prob=proba)!=0)
 w[k] <- rgamma(1, shape=nu[c[k]]/2, rate=nu[c[k]]/2)
 z[,k] <- xi[, c[k]] + psi[, c[k]]*rtruncnorm(n=1, a=0, b=Inf, mean=0, sd=1/sqrt(w[k])) +
               (sdev[, , c[k]]/sqrt(w[k]))%*%matrix(rnorm(d, mean = 0, sd = 1), nrow=d, ncol=1)
}

# Define hyperprior
hyperG0 <- list()
hyperG0[["b_xi"]] <- rowMeans(z)
hyperG0[["b_psi"]] <- rep(0,d)
hyperG0[["kappa"]] <- 0.001
hyperG0[["D_xi"]] <- 100
hyperG0[["D_psi"]] <- 100
hyperG0[["nu"]] <- d+1
hyperG0[["lambda"]] <- diag(apply(z,MARGIN=1, FUN=var))/3


## Not run: 
##D # Plot data
##D cytoScatter(z)
##D 
##D # Estimate posterior
##D MCMCsample_st <- DPMpost(data=z, hyperG0=hyperG0, N=2000,
##D    distrib="skewt",
##D    gg.add=list(ggplot2::theme_bw(),
##D       ggplot2::guides(shape=ggplot2::guide_legend(override.aes = list(fill="grey45"))))
##D  )
##D  s <- summary(MCMCsample_st, burnin = 1600, thin=5, lossFn = "Binder")
##D  s
##D  plot(s)
##D  #plot(s, hm=TRUE) # this can take a few sec...
##D  
##D  
##D  # more data plotting:
##D  library(ggplot2)
##D  p <- (ggplot(data.frame("X"=z[1,], "Y"=z[2,]), aes(x=X, y=Y))
##D        + geom_point()
##D        + ggtitle("Unsupervised data")
##D        + xlab("D1")
##D        + ylab("D2")
##D        + theme_bw()
##D  )
##D  p
##D 
##D  c2plot <- factor(c)
##D  levels(c2plot) <- c("4", "1", "3", "2")
##D  pp <- (ggplot(data.frame("X"=z[1,], "Y"=z[2,], "Cluster"=as.character(c2plot)))
##D        + geom_point(aes(x=X, y=Y, colour=Cluster, fill=Cluster))
##D        + ggtitle("True clusters")
##D        + xlab("D1")
##D        + ylab("D2")
##D        + theme_bw()
##D        + scale_colour_discrete(guide=guide_legend(override.aes = list(size = 6, shape=22)))
##D  )
##D  pp
## End(Not run)




# Exemple in 2 dimensions with Gaussian distributions

set.seed(1234)

# Generate data 
n <- 2000 # number of data points
d <- 2 # dimensions
ncl <- 4 # number of true clusters
m <- matrix(nrow=2, ncol=4, c(-1, 1, 1.5, 2, 2, -2, -1.5, -2)) # cluster means
sdev <- array(dim=c(2, 2, 4)) # cluster standard-deviations
sdev[, ,1] <- matrix(nrow=2, ncol=2, c(0.3, 0, 0, 0.3))
sdev[, ,2] <- matrix(nrow=2, ncol=2, c(0.1, 0, 0, 0.3))
sdev[, ,3] <- matrix(nrow=2, ncol=2, c(0.3, 0.15, 0.15, 0.3))
sdev[, ,4] <- .3*diag(2)
proba <- c(0.15, 0.05, 0.5, 0.3) # cluster frequencies
c <- rep(0,n)
z <- matrix(0, nrow=2, ncol=n)
for(k in 1:n){
 c[k] = which(rmultinom(n=1, size=1, prob=proba)!=0)
 z[,k] <- m[, c[k]] + sdev[, , c[k]]%*%matrix(rnorm(2, mean = 0, sd = 1), nrow=2, ncol=1)
}

# Define hyperprior
hyperG0 <- list()
hyperG0[["mu"]] <- rep(0,d)
hyperG0[["kappa"]] <- 0.001
hyperG0[["nu"]] <- d+2
hyperG0[["lambda"]] <- diag(d)


## Not run: 
##D # Plot data
##D cytoScatter(z)
##D 
##D # Estimate posterior
##D MCMCsample_n <- DPMpost(data=z, hyperG0=hyperG0, N=2000,
##D    distrib="gaussian", diagVar=FALSE,
##D    gg.add=list(ggplot2::theme_bw(),
##D       ggplot2::guides(shape=ggplot2::guide_legend(override.aes = list(fill="grey45"))))
##D  )
##D  s <- summary(MCMCsample_n, burnin = 1500, thin=5, lossFn = "Binder")
##D  s
##D  plot(s)
##D  #plot(s, hm=TRUE) # this can take a few sec...
##D  
##D  
##D  # more data plotting:
##D  library(ggplot2)
##D  p <- (ggplot(data.frame("X"=z[1,], "Y"=z[2,]), aes(x=X, y=Y))
##D        + geom_point()
##D        + ggtitle("Unsupervised data")
##D        + xlab("D1")
##D        + ylab("D2")
##D        + theme_bw()
##D  )
##D  p
##D 
##D  c2plot <- factor(c)
##D  levels(c2plot) <- c("4", "1", "3", "2")
##D  pp <- (ggplot(data.frame("X"=z[1,], "Y"=z[2,], "Cluster"=as.character(c2plot)))
##D        + geom_point(aes(x=X, y=Y, colour=Cluster, fill=Cluster))
##D        #+ ggtitle("Slightly overlapping skew-normal simulation\n")
##D        + xlab("D1")
##D        + ylab("D2")
##D        + theme_bw()
##D        + scale_colour_discrete(guide=guide_legend(override.aes = list(size = 6, shape=22)))
##D        + ggtitle("True clusters")
##D  )
##D  pp
## End(Not run)






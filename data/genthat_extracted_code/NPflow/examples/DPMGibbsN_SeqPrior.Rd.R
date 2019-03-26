library(NPflow)


### Name: DPMGibbsN_SeqPrior
### Title: Slice Sampling of Dirichlet Process Mixture of Gaussian
###   distibutions
### Aliases: DPMGibbsN_SeqPrior

### ** Examples


rm(list=ls())
#Number of data
n <- 1500
# Sample data
#m <- matrix(nrow=2, ncol=4, c(-1, 1, 1.5, 2, 2, -2, 0.5, -2))
m <- matrix(nrow=2, ncol=4, c(-.8, .7, .5, .7, .5, -.7, -.5, -.7))
p <- c(0.2, 0.1, 0.4, 0.3) # frequence des clusters

sdev <- array(dim=c(2,2,4))
sdev[, ,1] <- matrix(nrow=2, ncol=2, c(0.3, 0, 0, 0.3))
sdev[, ,2] <- matrix(nrow=2, ncol=2, c(0.1, 0, 0, 0.3))
sdev[, ,3] <- matrix(nrow=2, ncol=2, c(0.3, 0.15, 0.15, 0.3))
sdev[, ,4] <- .3*diag(2)
c <- rep(0,n)
z <- matrix(0, nrow=2, ncol=n)
for(k in 1:n){
 c[k] = which(rmultinom(n=1, size=1, prob=p)!=0)
 z[,k] <- m[, c[k]] + sdev[, , c[k]]%*%matrix(rnorm(2, mean = 0, sd = 1), nrow=2, ncol=1)
 #cat(k, "/", n, " observations simulated\n", sep="")
}

d<-2
# Set parameters of G0
hyperG0 <- list()
hyperG0[["mu"]] <- rep(0,d)
hyperG0[["kappa"]] <- 0.001
hyperG0[["nu"]] <- d+2
hyperG0[["lambda"]] <- diag(d)/10

# hyperprior on the Scale parameter of DPM
a <- 0.0001
b <- 0.0001

# Number of iterations
N <- 30

# do some plots
doPlot <- TRUE
nbclust_init <- 20



## Data
########
library(ggplot2)
p <- (ggplot(data.frame("X"=z[1,], "Y"=z[2,]), aes(x=X, y=Y))
      + geom_point()
      + ggtitle("Toy example Data"))
p



# Gibbs sampler for Dirichlet Process Mixtures
##############################################
## Not run: 
##D MCMCsample <- DPMGibbsN(z, hyperG0, a, b, N=1500, doPlot, nbclust_init, plotevery=200,
##D                         gg.add=list(theme_bw(),
##D                                  guides(shape=guide_legend(override.aes = list(fill="grey45")))),
##D                         diagVar=FALSE)
##D 
##D s <- summary(MCMCsample, posterior_approx=TRUE, burnin = 1000, thin=5)
##D F1 <- FmeasureC(pred=s$point_estim$c_est, ref=c)
##D F1
##D 
##D 
##D MCMCsample2 <- DPMGibbsN_SeqPrior(z, prior_inform=s$param_posterior,
##D                                   hyperG0, N=1500,
##D                                   add.vagueprior = TRUE,
##D                                   doPlot=TRUE, plotevery=100,
##D                                   nbclust_init=nbclust_init,
##D                                   gg.add=list(theme_bw(),
##D                                  guides(shape=guide_legend(override.aes = list(fill="grey45")))),
##D                                   diagVar=FALSE)
##D 
##D 
##D s2 <- summary(MCMCsample2, burnin = 500, thin=5)
##D F2 <- FmeasureC(pred=s2$point_estim$c_est, ref=c)
##D F2
## End(Not run)




library(NPflow)


### Name: DPMGibbsSkewT_SeqPrior
### Title: Slice Sampling of Dirichlet Process Mixture of skew Students's
###   t-distibutions
### Aliases: DPMGibbsSkewT_SeqPrior

### ** Examples

rm(list=ls())

#Number of data
n <- 2000
set.seed(123)


d <- 2
ncl <- 4

# Sample data

sdev <- array(dim=c(d,d,ncl))

xi <- matrix(nrow=d, ncol=ncl, c(-1.5, 1, 1.5, 1, 1.5, -2, -2, -2))
psi <- matrix(nrow=d, ncol=4, c(0.4, -0.6, 0.8, 0, 0.3, -0.7, -0.3, -0.8))
nu <- c(100,15,8,5)
p <- c(0.15, 0.05, 0.5, 0.3) # frequence des clusters
sdev[, ,1] <- matrix(nrow=d, ncol=d, c(0.3, 0, 0, 0.3))
sdev[, ,2] <- matrix(nrow=d, ncol=d, c(0.1, 0, 0, 0.3))
sdev[, ,3] <- matrix(nrow=d, ncol=d, c(0.3, 0.15, 0.15, 0.3))
sdev[, ,4] <- .3*diag(2)


c <- rep(0,n)
w <- rep(1,n)
z <- matrix(0, nrow=d, ncol=n)
for(k in 1:n){
 c[k] = which(rmultinom(n=1, size=1, prob=p)!=0)
 w[k] <- rgamma(1, shape=nu[c[k]]/2, rate=nu[c[k]]/2)
 z[,k] <- xi[, c[k]] + psi[, c[k]]*rtruncnorm(n=1, a=0, b=Inf, mean=0, sd=1/sqrt(w[k])) +
                (sdev[, , c[k]]/sqrt(w[k]))%*%matrix(rnorm(d, mean = 0, sd = 1), nrow=d, ncol=1)
 #cat(k, "/", n, " observations simulated\n", sep="")
}

# Set parameters of G0
hyperG0 <- list()
hyperG0[["b_xi"]] <- rowMeans(z)
hyperG0[["b_psi"]] <- rep(0,d)
hyperG0[["kappa"]] <- 0.001
hyperG0[["D_xi"]] <- 100
hyperG0[["D_psi"]] <- 100
hyperG0[["nu"]] <- d+1
hyperG0[["lambda"]] <- diag(apply(z,MARGIN=1, FUN=var))/3

 # hyperprior on the Scale parameter of DPM
 a <- 0.0001
 b <- 0.0001

 # do some plots
 nbclust_init <- 30

 ## Plot Data
 library(ggplot2)
 q <- (ggplot(data.frame("X"=z[1,], "Y"=z[2,]), aes(x=X, y=Y))
       + geom_point()
       + ggtitle("Simple example in 2d data")
       +xlab("D1")
       +ylab("D2")
       +theme_bw())
 q

 ## Not run: 
##D  MCMCsample_st <- DPMGibbsSkewT(z, hyperG0, a, b, N=2000,
##D                                 doPlot=TRUE, plotevery=250,
##D                                 nbclust_init, diagVar=FALSE,
##D                                 gg.add=list(theme_bw(),
##D                                  guides(shape=guide_legend(override.aes = list(fill="grey45")))))
##D  s <- summary(MCMCsample_st, burnin = 1500, thin=2, posterior_approx=TRUE)
##D  F <- FmeasureC(pred=s$point_estim$c_est, ref=c)
##D 
##D for(k in 1:n){
##D  c[k] = which(rmultinom(n=1, size=1, prob=p)!=0)
##D  w[k] <- rgamma(1, shape=nu[c[k]]/2, rate=nu[c[k]]/2)
##D  z[,k] <- xi[, c[k]] + psi[, c[k]]*rtruncnorm(n=1, a=0, b=Inf, mean=0, sd=1/sqrt(w[k])) +
##D                 (sdev[, , c[k]]/sqrt(w[k]))%*%matrix(rnorm(d, mean = 0, sd = 1), nrow=d, ncol=1)
##D  cat(k, "/", n, " observations simulated\n", sep="")
##D }
##D  MCMCsample_st2 <- DPMGibbsSkewT_SeqPrior(z, prior=s$param_posterior,
##D                                           hyperG0, N=2000,
##D                                           doPlot=TRUE, plotevery=100,
##D                                           nbclust_init, diagVar=FALSE,
##D                                           gg.add=list(theme_bw(),
##D                                  guides(shape=guide_legend(override.aes = list(fill="grey45")))))
##D s2 <- summary(MCMCsample_st2, burnin = 1500, thin=5)
##D F2 <- FmeasureC(pred=s2$point_estim$c_est, ref=c)
##D 
##D # MCMCsample_st2_par <- DPMGibbsSkewT_SeqPrior_parallel(Ncpus= 2, type_connec="SOCK",
##D #                                                       z, prior_inform=s$param_posterior,
##D #                                                       hyperG0, N=2000,
##D #                                                       doPlot=TRUE, plotevery=50,
##D #                                                       nbclust_init, diagVar=FALSE,
##D #                                                       gg.add=list(theme_bw(),
##D                                  guides(shape=guide_legend(override.aes = list(fill="grey45"))))
## End(Not run)






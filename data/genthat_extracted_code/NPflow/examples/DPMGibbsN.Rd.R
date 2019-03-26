library(NPflow)


### Name: DPMGibbsN
### Title: Slice Sampling of the Dirichlet Process Mixture Model with a
###   prior on alpha
### Aliases: DPMGibbsN

### ** Examples

rm(list=ls())
#Number of data
n <- 500
#n <- 2000
set.seed(1234)
#set.seed(123)
#set.seed(4321)

# Sample data
m <- matrix(nrow=2, ncol=4, c(-1, 1, 1.5, 2, 2, -2, -1.5, -2))
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
 nbclust_init <- 30



 ## Data
 ########
 library(ggplot2)
 p <- (ggplot(data.frame("X"=z[1,], "Y"=z[2,]), aes(x=X, y=Y))
       + geom_point()
       + ggtitle("Toy example Data"))
 p


 ## alpha priors plots
 #####################
 prioralpha <- data.frame("alpha"=rgamma(n=5000, shape=a, scale=1/b),
                         "distribution" =factor(rep("prior",5000),
                         levels=c("prior", "posterior")))
 p <- (ggplot(prioralpha, aes(x=alpha))
       + geom_histogram(aes(y=..density..),
                        colour="black", fill="white", bins=30)
       + geom_density(alpha=.6, fill="red", color=NA)
       + ggtitle(paste("Prior distribution on alpha: Gamma(", a,
                 ",", b, ")\n", sep=""))
       + theme_bw()
      )
 p



 # Gibbs sampler for Dirichlet Process Mixtures
 ##############################################
## Not run: 
##D  MCMCsample <- DPMGibbsN(z, hyperG0, a, b, N=500, doPlot, nbclust_init, plotevery=100,
##D                          gg.add=list(theme_bw(),
##D                                  guides(shape=guide_legend(override.aes = list(fill="grey45")))),
##D                          diagVar=FALSE)
##D 
##D  plot_ConvDPM(MCMCsample, from=2)
##D 
##D  s <- summary(MCMCsample, burnin = 200, thin=2, posterior_approx=FALSE,
##D  lossFn = "MBinderN")
##D 
##D  F <- FmeasureC(pred=s$point_estim$c_est, ref=c)
##D 
##D  postalpha <- data.frame("alpha"=MCMCsample$alpha[50:500],
##D                          "distribution" = factor(rep("posterior",500-49),
##D                          levels=c("prior", "posterior")))
##D  p <- (ggplot(postalpha, aes(x=alpha))
##D        + geom_histogram(aes(y=..density..), binwidth=.1,
##D                         colour="black", fill="white")
##D        + geom_density(alpha=.2, fill="blue")
##D        + ggtitle("Posterior distribution of alpha\n")
##D        # Ignore NA values for mean
##D        # Overlay with transparent density plot
##D        + geom_vline(aes(xintercept=mean(alpha, na.rm=TRUE)),
##D                     color="red", linetype="dashed", size=1)
##D      )
##D  p
##D 
##D  p <- (ggplot(drop=FALSE, alpha=.6)
##D        + geom_density(aes(x=alpha, fill=distribution),
##D                       color=NA, alpha=.6,
##D                       data=prioralpha)
##D        #+ geom_density(aes(x=alpha, fill=distribution),
##D        #               color=NA, alpha=.6,
##D        #               data=postalpha)
##D        + ggtitle("Prior and posterior distributions of alpha\n")
##D        + scale_fill_discrete(drop=FALSE)
##D        + theme_bw()
##D        +xlim(0,10)
##D        +ylim(0, 1.3)
##D      )
##D  p
##D 
## End(Not run)

# k-means comparison
####################

 plot(x=z[1,], y=z[2,], col=kmeans(t(z), centers=4)$cluster,
      xlab = "d = 1", ylab= "d = 2", main="k-means with K=4 clusters")

 KM <- kmeans(t(z), centers=4)
 dataKM <- data.frame("X"=z[1,], "Y"=z[2,],
                    "Cluster"=as.character(KM$cluster))
 dataCenters <- data.frame("X"=KM$centers[,1],
                           "Y"=KM$centers[,2],
                           "Cluster"=rownames(KM$centers))

 p <- (ggplot(dataKM)
       + geom_point(aes(x=X, y=Y, col=Cluster))
       + geom_point(aes(x=X, y=Y, fill=Cluster, order=Cluster),
                    data=dataCenters, shape=22, size=5)
       + scale_colour_discrete(name="Cluster")
       + ggtitle("K-means with K=4 clusters\n"))
 p








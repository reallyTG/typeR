library(NPflow)


### Name: DPMGibbsSkewN
### Title: Slice Sampling of Dirichlet Process Mixture of skew normal
###   ditributions
### Aliases: DPMGibbsSkewN

### ** Examples

rm(list=ls())

#Number of data
n <- 1000
set.seed(123)

d <- 2
ncl <- 4

# Sample data

sdev <- array(dim=c(d,d,ncl))

#xi <- matrix(nrow=d, ncol=ncl, c(-1.5, 1, 1.5, 1, 1.5, -2, -2, -2))
xi <- matrix(nrow=d, ncol=ncl, c(-0.5, 0, 0.5, 0, 0.5, -1, -1, 1))
##xi <- matrix(nrow=d, ncol=ncl, c(-0.3, 0, 0.5, 0.5, 0.5, -1.2, -1, 1))
psi <- matrix(nrow=d, ncol=4, c(0.4, -0.6, 0.8, 0, 0.3, -0.7, -0.3, -1.2))
p <- c(0.2, 0.1, 0.4, 0.3) # frequence des clusters
sdev[, ,1] <- matrix(nrow=d, ncol=d, c(0.3, 0, 0, 0.3))
sdev[, ,2] <- matrix(nrow=d, ncol=d, c(0.1, 0, 0, 0.3))
sdev[, ,3] <- matrix(nrow=d, ncol=d, c(0.3, 0.15, 0.15, 0.3))
sdev[, ,4] <- .3*diag(2)


c <- rep(0,n)
z <- matrix(0, nrow=d, ncol=n)
for(k in 1:n){
 c[k] = which(rmultinom(n=1, size=1, prob=p)!=0)
 z[,k] <- xi[, c[k]] + psi[, c[k]]*abs(rnorm(1)) + sdev[, , c[k]]%*%matrix(rnorm(d, mean = 0,
                                                                       sd = 1), nrow=d, ncol=1)
 #cat(k, "/", n, " observations simulated\n", sep="")
}

# Set parameters of G0
hyperG0 <- list()
hyperG0[["b_xi"]] <- rep(0,d)
hyperG0[["b_psi"]] <- rep(0,d)
hyperG0[["kappa"]] <- 0.0001
hyperG0[["D_xi"]] <- 100
hyperG0[["D_psi"]] <- 100
hyperG0[["nu"]] <- d + 1
hyperG0[["lambda"]] <- diag(d)

 # hyperprior on the Scale parameter of DPM
 a <- 0.0001
 b <- 0.0001

 # do some plots
 doPlot <- TRUE
 nbclust_init <- 30



 ## Data
 ########
 library(ggplot2)
 p <- (ggplot(data.frame("X"=z[1,], "Y"=z[2,]), aes(x=X, y=Y))
       + geom_point()
       + ggtitle("Simple example in 2d data")
       +xlab("D1")
       +ylab("D2")
       +theme_bw())
 p

 c2plot <- factor(c)
 levels(c2plot) <- c("3", "2", "4", "1")
 pp <- (ggplot(data.frame("X"=z[1,], "Y"=z[2,], "Cluster"=as.character(c2plot)))
       + geom_point(aes(x=X, y=Y, colour=Cluster, fill=Cluster))
       + ggtitle("Slightly overlapping skew-normal simulation\n")
       + xlab("D1")
       + ylab("D2")
       + theme_bw()
       + scale_colour_discrete(guide=guide_legend(override.aes = list(size = 6, shape=22))))
 pp


 ## alpha priors plots
 #####################
 prioralpha <- data.frame("alpha"=rgamma(n=5000, shape=a, scale=1/b),
                         "distribution" =factor(rep("prior",5000),
                         levels=c("prior", "posterior")))
 p <- (ggplot(prioralpha, aes(x=alpha))
       + geom_histogram(aes(y=..density..),
                        colour="black", fill="white")
       + geom_density(alpha=.2, fill="red")
       + ggtitle(paste("Prior distribution on alpha: Gamma(", a,
                 ",", b, ")\n", sep=""))
      )
 p


## Not run: 
##D  # Gibbs sampler for Dirichlet Process Mixtures
##D  ##############################################
##D 
##D  MCMCsample_sn <- DPMGibbsSkewN(z, hyperG0, a, b, N=2500,
##D                                 doPlot, nbclust_init, plotevery=100,
##D                                 gg.add=list(theme_bw(),
##D                                  guides(shape=guide_legend(override.aes = list(fill="grey45")))),
##D                                diagVar=FALSE)
##D 
##D  s <- summary(MCMCsample_sn, burnin = 2000, thin=10)
##D  #cluster_est_binder(MCMCsample_sn$mcmc_partitions[1000:1500])
##D  print(s)
##D  plot(s)
##D  #plot_ConvDPM(MCMCsample_sn, from=2)
##D 
##D 
##D 
##D 
##D 
##D 
##D  # k-means
##D 
##D  plot(x=z[1,], y=z[2,], col=kmeans(t(z), centers=4)$cluster,
##D       xlab = "d = 1", ylab= "d = 2", main="k-means with K=4 clusters")
##D 
##D  KM <- kmeans(t(z), centers=4)
##D  KMclust <- factor(KM$cluster)
##D  levels(KMclust) <- c("2", "4", "1", "3")
##D  dataKM <- data.frame("X"=z[1,], "Y"=z[2,],
##D                     "Cluster"=as.character(KMclust))
##D  dataCenters <- data.frame("X"=KM$centers[,1],
##D                            "Y"=KM$centers[,2],
##D                            "Cluster"=c("2", "4", "1", "3"))
##D 
##D 
##D  p <- (ggplot(dataKM)
##D        + geom_point(aes(x=X, y=Y, col=Cluster))
##D        + geom_point(aes(x=X, y=Y, fill=Cluster, order=Cluster),
##D                     data=dataCenters, shape=22, size=5)
##D        + scale_colour_discrete(name="Cluster",
##D                                guide=guide_legend(override.aes=list(size=6, shape=22)))
##D        + ggtitle("K-means with K=4 clusters\n")
##D        + theme_bw()
##D  )
##D  p
##D 
##D  postalpha <- data.frame("alpha"=MCMCsample_sn$alpha[501:1000],
##D                          "distribution" = factor(rep("posterior",1000-500),
##D                          levels=c("prior", "posterior")))
##D 
##D  postK <- data.frame("K"=sapply(lapply(postalpha$alpha, "["),
##D                                 function(x){sum(x/(x+0:(1000-1)))}))
##D 
##D  p <- (ggplot(postalpha, aes(x=alpha))
##D        + geom_histogram(aes(y=..density..), binwidth=.1,
##D                         colour="black", fill="white")
##D        + geom_density(alpha=.2, fill="blue")
##D        + ggtitle("Posterior distribution of alpha\n")
##D        # Ignore NA values for mean
##D        # Overlay with transparent density plot
##D        + geom_vline(aes(xintercept=mean(alpha, na.rm=T)),
##D                     color="red", linetype="dashed", size=1)
##D      )
##D  p
##D 
##D  p <- (ggplot(postK, aes(x=K))
##D        + geom_histogram(aes(y=..density..),
##D                         colour="black", fill="white")
##D        + geom_density(alpha=.2, fill="blue")
##D        + ggtitle("Posterior distribution of predicted K\n")
##D        # Ignore NA values for mean
##D        # Overlay with transparent density plot
##D        + geom_vline(aes(xintercept=mean(K, na.rm=T)),
##D                     color="red", linetype="dashed", size=1)
##D        #+ scale_x_continuous(breaks=c(0:6)*2, minor_breaks=c(0:6)*2+1)
##D        + scale_x_continuous(breaks=c(1:12))
##D      )
##D  p
##D 
##D  p <- (ggplot(drop=FALSE, alpha=.6)
##D        + geom_density(aes(x=alpha, fill=distribution),
##D                       color=NA, alpha=.6,
##D                       data=postalpha)
##D        + geom_density(aes(x=alpha, fill=distribution),
##D                       color=NA, alpha=.6,
##D                       data=prioralpha)
##D        + ggtitle("Prior and posterior distributions of alpha\n")
##D        + scale_fill_discrete(drop=FALSE)
##D        + theme_bw()
##D        + xlim(0,100)
##D      )
##D  p
##D 
##D #Skew Normal
##D n=100000
##D xi <- 0
##D d <- 0.995
##D alpha <- d/sqrt(1-d^2)
##D z <- rtruncnorm(n,a=0, b=Inf)
##D e <- rnorm(n, mean = 0, sd = 1)
##D x <- d*z + sqrt(1-d^2)*e
##D o <- 1
##D y <- xi+o*x
##D nu=1.3
##D w <- rgamma(n,scale=nu/2, shape=nu/2)
##D yy <- xi+o*x/w
##D snd <- data.frame("Y"=y,"YY"=yy)
##D p <- (ggplot(snd)+geom_density(aes(x=Y), fill="blue", alpha=.2)
##D      + theme_bw()
##D      + ylab("Density")
##D      + ggtitle("Y~SN(0,1,10)\n")
##D      + xlim(-1,6)
##D      + ylim(0,0.8)
##D      )
##D p
##D 
##D p <- (ggplot(snd)+geom_density(aes(x=YY), fill="blue", alpha=.2)
##D      + theme_bw()
##D      + ylab("Density")
##D      + ggtitle("Y~ST(0,1,10,1.3)\n")
##D      + xlim(-2,40)
##D      + ylim(0,0.8)
##D      )
##D p
##D 
##D p <- (ggplot(snd)
##D      + geom_density(aes(x=Y, fill="blue"), alpha=.2)
##D      + geom_density(aes(x=YY, fill="red"), alpha=.2)
##D      + theme_bw()
##D      +theme(legend.text = element_text(size = 13), legend.position="bottom")
##D      + ylab("Density")
##D      + xlim(-2,40)
##D      + ylim(0,0.8)
##D      + scale_fill_manual(name="", labels=c("Y~SN(0,1,10)       ", "Y~ST(0,1,10,1.3)"),
##D      guide="legend", values=c("blue", "red"))
##D      )
##D p
##D 
##D #Variations
##D n=100000
##D xi <- -1
##D d <- 0.995
##D alpha <- d/sqrt(1-d^2)
##D z <- rtruncnorm(n,a=0, b=Inf)
##D e <- rnorm(n, mean = 0, sd = 1)
##D x <- d*z + sqrt(1-d^2)*e
##D snd <- data.frame("X"=x)
##D p <- (ggplot(snd)+geom_density(aes(x=X), fill="blue", alpha=.2)
##D      + theme_bw()
##D      + ylab("Density")
##D      + ggtitle("X~SN(10)\n")
##D      + xlim(-1.5,4)
##D      + ylim(0,1.6)
##D      )
##D p
##D 
##D o <- 0.5
##D y <- xi+o*x
##D snd <- data.frame("Y"=y)
##D p <- (ggplot(snd)+geom_density(aes(x=Y), fill="blue", alpha=.2)
##D      + theme_bw()
##D      + ylab("Density")
##D      + ggtitle("Y~SN(-1,1,10)\n")
##D      + xlim(-1.5,4)
##D      + ylim(0,1.6)
##D      )
##D p
##D 
##D 
##D 
##D 
##D #Simple toy example
##D ###################
##D 
##D n <- 500
##D set.seed(12345)
##D 
##D 
##D d <- 2
##D ncl <- 4
##D 
##D # Sample data
##D 
##D sdev <- array(dim=c(d,d,ncl))
##D 
##D xi <- matrix(nrow=d, ncol=ncl, c(-1.5, 1, 1.5, 1, 1.5, -2, -2, -2))
##D psi <- matrix(nrow=d, ncol=4, c(0.4, -0.6, 0.8, 0, 0.3, -0.7, -0.3, -1.2))
##D p <- c(0.2, 0.1, 0.4, 0.3) # frequence des clusters
##D sdev[, ,1] <- matrix(nrow=d, ncol=d, c(0.3, 0, 0, 0.3))
##D sdev[, ,2] <- matrix(nrow=d, ncol=d, c(0.1, 0, 0, 0.3))
##D sdev[, ,3] <- matrix(nrow=d, ncol=d, c(0.3, 0.15, 0.15, 0.3))
##D sdev[, ,4] <- .3*diag(2)
##D 
##D #' # Set parameters of G0
##D hyperG0 <- list()
##D hyperG0[["b_xi"]] <- rep(0,d)
##D hyperG0[["b_psi"]] <- rep(0,d)
##D hyperG0[["kappa"]] <- 0.0001
##D hyperG0[["D_xi"]] <- 100
##D hyperG0[["D_psi"]] <- 100
##D hyperG0[["nu"]] <- d + 1
##D hyperG0[["lambda"]] <- diag(d)
##D 
##D 
##D c <- rep(0,n)
##D z <- matrix(0, nrow=d, ncol=n)
##D for(k in 1:n){
##D  c[k] = which(rmultinom(n=1, size=1, prob=p)!=0)
##D  z[,k] <- xi[, c[k]] + psi[, c[k]]*abs(rnorm(1)) + sdev[, , c[k]]%*%matrix(rnorm(d, mean = 0,
##D                                                                         sd = 1), nrow=d, ncol=1)
##D  cat(k, "/", n, " observations simulated\n", sep="")
##D }
##D 
##D  MCMCsample_sn_sep <- DPMGibbsSkewN(z, hyperG0, a, b, N=600,
##D                                     doPlot, nbclust_init, plotevery=100,
##D                                     gg.add=list(theme_bw(),
##D                                guides(shape=guide_legend(override.aes = list(fill="grey45")))),
##D                                     diagVar=TRUE)
##D 
##D  s <- summary(MCMCsample_sn, burnin = 400)
##D 
## End(Not run)





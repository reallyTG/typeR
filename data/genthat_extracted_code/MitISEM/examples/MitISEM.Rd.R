library(MitISEM)


### Name: MitISEM
### Title: Mixture of Student-t distributions using Importance Sampling
###   weighted Expectation Maximization steps
### Aliases: MitISEM

### ** Examples

require(graphics)
set.seed(1234);
# define Gelman Meng Kernel
GelmanMeng <- function(x, A = 1, B = 0, C1 = 3, C2 = 3, log = TRUE){
	    if (is.vector(x))
	    x <- matrix(x, nrow = 1)
	    r <- -.5 * (A * x[,1]^2 * x[,2]^2 + x[,1]^2 + x[,2]^2
                 - 2 * B * x[,1] * x[,2] - 2 * C1 * x[,1] - 2 * C2 * x[,2])
	    if (!log)
	    r <- exp(r)
	    as.vector(r)
}
# get MitISEM approximation
mu0 <-c(3,4)
app.MitISEM <- MitISEM(KERNEL=GelmanMeng,mu0=mu0,control=list(N=2000,trace=TRUE))
mit=app.MitISEM$mit

# plot approximation (components and full approximation)
MitISEM.plot.comps <- function(mit,x1,x2,log=FALSE){
  Mitcontour <- function(x1,x2,mit,log=FALSE){
    dmvgt(cbind(x1,x2),mit=mit,log=log)
  } 
  H <- length(mit$p)
  K <- ncol(mit$mu)
  cols <- 1:H
  for (h in 1:H){
    mit.h  <-list(p=1,mu=matrix(mit$mu[h,],1,K),
                Sigma=matrix(mit$Sigma[h,],1,(K^2)),df=mit$df[h])
    z      <- outer(x1,x2,FUN=Mitcontour,mit=mit.h)
    contour(x1,x2,z,col=h,lty=h,labels="",add=(h!=1),
            xlab="x1",ylab="x2",main='MitISEM approximation components')
  }	
  legend("topright",paste("component ",1:H),lty=cols,col=cols,bty='n')
  z <- outer(x1,x2, FUN=Mitcontour,mit=mit)
  image(x1,x2,z,las=1,col=gray((20:0)/20),main='MitISEM approximation')
}
x1 <- seq(-2,6,0.05)
x2 <- seq(-2,7,0.05)
MitISEM.plot.comps(mit,x1,x2)

## Not run: 
##D   # Bayesian inference of the GARCH model using MitISEM and Importance Sampling
##D   library(AdMit) # required for Importance Sampling
##D   library(tseries) # required for loading the data
##D   # load data : downloaded on 2013/01/18
##D   prices <- as.vector(get.hist.quote("^GSPC",quote="AdjClose",start="1998-01-02",end="2002-12-26"))
##D   data  <- 100 * (prices[-1] - prices[-length(prices)]) / (prices[-length(prices)]) 
##D   prior.GARCH<-function(omega,beta,alpha,
##D                         mu,log=TRUE){
##D     c1 <- (omega>0 & omega <1 & beta>=0 & alpha>=0)
##D     c2 <- (beta + alpha< 1)
##D     c3 <- (mu>-1 & mu<1)
##D     r1 <- c1 & c2 & c3
##D     r2 <- rep.int(-Inf,length(omega))
##D     r2[r1==TRUE] <- 0
##D     if (!log)
##D       r2 <- exp(r2)
##D     cbind(r1,r2)
##D   }
##D   post.GARCH <- function(theta,data,h1,log=TRUE){
##D     if (is.vector(theta))
##D       theta <- matrix(theta, nrow = 1)
##D     omega <- theta[,1]
##D     beta <- theta[,2]
##D     alpha <- theta[,3]
##D     mu <- theta[,4]
##D     N <- nrow(theta)
##D     pos <- 2:length(data)
##D     prior <- prior.GARCH(omega=omega,beta=beta,alpha=alpha,mu=mu)
##D     d <- rep.int(-Inf,N)
##D     for (i in 1:N){
##D       if (prior[i,1] == TRUE){
##D         h <- c(h1, omega[i] + alpha[i] * (data[pos-1]-mu[i])^2)
##D         for (j in pos){
##D           h[j] <- h[j] + beta[i] * h[j-1]
##D         }
##D         tmp <- dnorm(data[pos],mu[i],sqrt(h[pos]),log=TRUE)
##D         d[i] <- sum(tmp) + prior[i,2]
##D       }
##D     }
##D     if (!log) d <- exp(d)
##D     as.numeric(d)
##D   }
##D   theta <- c(.08, .86, .02, .03) # initial parameters for MitISEM
##D   names(theta)<-c("omega","beta","alpha","mu")
##D   h1 <- var(data) # initial data variance
##D   # MitISEM GARCH approximation
##D   cat("MitISEM GARCH results",fill=TRUE)
##D   cat('--------------------------',fill=TRUE)
##D   set.seed(1111)
##D   app.GARCH <- MitISEM(KERNEL=post.GARCH,
##D                        mu0=theta, control=list(trace=TRUE),h1=h1,
##D                        data=data)
##D   print(app.GARCH$summary)
##D   # Importance Sampling using MitISEM candidate
##D   cat('Importance Sampling result from MitISEM candidate',fill=TRUE)
##D   cat('---------------------------------------------------',fill=TRUE)
##D   set.seed(1111)
##D   IS.MitISEM.GARCH <- AdMitIS(N = 10e4,data=data,h1=h1,
##D                               KERNEL=post.GARCH,mit=app.GARCH$mit)
##D   print(IS.MitISEM.GARCH)
## End(Not run)





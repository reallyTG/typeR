library(DPpackage)


### Name: LDDPtwopl
### Title: Bayesian analysis for a dependent semiparametric two parameters
###   logistic model
### Aliases: LDDPtwopl LDDPtwopl.default
### Keywords: models nonparametric

### ** Examples

## Not run: 
##D     ####################################
##D     # A simulated Data Set
##D     ####################################
##D      
##D       grid <- seq(-4,4,0.01)
##D 
##D       dtrue1 <- function(grid)
##D       {
##D          0.6*dnorm(grid,-1,0.4)+
##D          0.3*dnorm(grid,0,0.5)+
##D          0.1*dnorm(grid,1,0.5)
##D       }
##D       
##D       dtrue2 <- function(grid)
##D       {
##D          0.5*dnorm(grid,-1,0.5)+
##D          0.5*dnorm(grid,1,0.5)
##D       }
##D 
##D       dtrue3 <- function(grid)
##D       {
##D          0.1*dnorm(grid,-1,0.5)+
##D          0.3*dnorm(grid,0,0.5)+
##D          0.6*dnorm(grid,1,0.4)
##D       }
##D 
##D       rtrue1 <- function(n)
##D       {
##D           ind <- sample(x=c(1,2,3),
##D           size=n,replace =TRUE, 
##D           prob =c(0.6,0.3,0.1))
##D           x1 <- rnorm(n,-1,0.4)
##D           x2 <- rnorm(n, 0,0.5)
##D           x3 <- rnorm(n, 1,0.5)
##D           x <- rep(0,n)
##D           x[ind==1] <- x1[ind==1] 
##D           x[ind==2] <- x2[ind==2] 
##D           x[ind==3] <- x3[ind==3]
##D           return(x)  
##D       }
##D 
##D       rtrue2 <- function(n)
##D       {
##D           ind <- sample(x=c(1,2),
##D           size=n,replace=TRUE, 
##D           prob =c(0.5,0.5))
##D           x1 <- rnorm(n,-1,0.5)
##D           x2 <- rnorm(n, 1,0.5)
##D           x <- rep(0,n)
##D           x[ind==1] <- x1[ind==1] 
##D           x[ind==2] <- x2[ind==2] 
##D           return(x)  
##D       }
##D 
##D       rtrue3 <- function(n)
##D       {
##D           ind <- sample(x=c(1,2,3),
##D           size=n,replace=TRUE, 
##D           prob =c(0.1,0.3,0.6))
##D           x1 <- rnorm(n,-1,0.5)
##D           x2 <- rnorm(n, 0,0.5)
##D           x3 <- rnorm(n, 1,0.4)
##D           x <- rep(0,n)
##D           x[ind==1] <- x1[ind==1] 
##D           x[ind==2] <- x2[ind==2] 
##D           x[ind==3] <- x3[ind==3]
##D           return(x)  
##D       }
##D 
##D       b1 <- rtrue1(n=200)
##D       hist(b1,prob=TRUE,xlim=c(-4,4),ylim=c(0,0.7)) 
##D       lines(grid,dtrue1(grid))
##D 
##D       b2 <- rtrue2(n=200)
##D       hist(b2,prob=TRUE,xlim=c(-4,4),ylim=c(0,0.7)) 
##D       lines(grid,dtrue2(grid))
##D 
##D       b3 <- rtrue3(n=200)
##D       hist(b3,prob=TRUE,xlim=c(-4,4),ylim=c(0,0.7)) 
##D       lines(grid,dtrue3(grid))
##D 
##D       nsubject <- 600
##D       theta <- c(b1,b2,b3)
##D       trt <- as.factor(c(rep(1,200),rep(2,200),rep(3,200)))
##D       nitem <- 40
##D       
##D       y <- matrix(0,nrow=nsubject,ncol=nitem)
##D       dimnames(y)<-list(paste("id",seq(1:nsubject)), 
##D                         paste("item",seq(1,nitem)))
##D 
##D       beta <- c(0,sample(seq(-1.8,1.8,length=nitem-1)))
##D       gam <- c(1,sample(seq(0.2,1.4,length=nitem-1)))
##D 
##D       for(i in 1:nsubject)
##D       {
##D          for(j in 1:nitem)
##D          {
##D             eta <- gam[j]*(theta[i]-beta[j])         
##D             prob <- exp(eta)/(1+exp(eta))
##D             y[i,j] <- rbinom(1,1,prob)
##D          }
##D       }
##D 
##D    ##############################
##D    # design's prediction matrix
##D    ##############################
##D 
##D      zpred <- matrix(c(1,0,0,
##D                        1,1,0,
##D                        1,0,1),nrow=3,ncol=3,byrow=TRUE)
##D 
##D    ###########################
##D    # prior
##D    ###########################
##D 
##D      prior <- list(alpha=1, 
##D                    beta0=rep(0,nitem-1),
##D                    Sbeta0=diag(1000,nitem-1),
##D                    r1=0,
##D                    r2=1,
##D                    mu0=rep(0,3),
##D                    S0=diag(100,3),
##D                    tau1=6.01,
##D                    taus1=6.01,
##D                    taus2=2.01,
##D                    nu=5,
##D                    psiinv=diag(1,3))
##D 
##D    ###########################
##D    # mcmc
##D    ###########################
##D      mcmc <- list(nburn=5000,
##D                   nskip=3,
##D                   ndisplay=200,
##D                   nsave=5000)
##D 
##D    ###########################
##D    # fitting the model
##D    ###########################
##D  
##D      fitLDDP <-  LDDPtwopl(formula=y ~ trt,
##D                            prior=prior,
##D                            mcmc=mcmc,
##D                            state=NULL,
##D                            status=TRUE,
##D                            zpred=zpred,
##D                            grid=grid,compute.band=TRUE)
##D   
##D      fitLDDP
##D 
##D      summary(fitLDDP)
##D 
##D    #########################################
##D    # plots
##D    #########################################
##D      plot(fitLDDP)
##D 
##D      plot(fitLDDP,param="prediction")
##D 
##D    #########################################
##D    # plot the estimated and true densities
##D    #########################################
##D 
##D      par(cex=1.5,mar=c(4.1, 4.1, 1, 1))
##D      plot(fitLDDP$grid,fitLDDP$dens.m[1,],xlim=c(-4,4),ylim=c(0,0.8),
##D           type="l",lty=1,lwd=3,xlab="Ability",ylab="density",col=1)
##D      lines(fitLDDP$grid,fitLDDP$dens.u[1,],lty=2,lwd=3,col=1)
##D      lines(fitLDDP$grid,fitLDDP$dens.l[1,],lty=2,lwd=3,col=1)
##D      lines(grid,dtrue1(grid),lwd=3,col="red",lty=3)
##D 
##D      par(cex=1.5,mar=c(4.1, 4.1, 1, 1))
##D      plot(fitLDDP$grid,fitLDDP$dens.m[2,],xlim=c(-4,4),ylim=c(0,0.8),
##D           type="l",lty=1,lwd=3,xlab="Ability",ylab="density",col=1)
##D      lines(fitLDDP$grid,fitLDDP$dens.u[2,],lty=2,lwd=3,col=1)
##D      lines(fitLDDP$grid,fitLDDP$dens.l[2,],lty=2,lwd=3,col=1)
##D      lines(grid,dtrue2(grid),lwd=3,col="red",lty=3)
##D 
##D      par(cex=1.5,mar=c(4.1, 4.1, 1, 1))
##D      plot(fitLDDP$grid,fitLDDP$dens.m[3,],xlim=c(-4,4),ylim=c(0,0.8),
##D           type="l",lty=1,lwd=3,xlab="Ability",ylab="density",col=1)
##D      lines(fitLDDP$grid,fitLDDP$dens.u[3,],lty=2,lwd=3,col=1)
##D      lines(fitLDDP$grid,fitLDDP$dens.l[3,],lty=2,lwd=3,col=1)
##D      lines(grid,dtrue3(grid),lwd=3,col="red",lty=3)
##D 
##D    #########################################
##D    # Extract random effects
##D    #########################################
##D      DPrandom(fitLDDP)
##D      plot(DPrandom(fitLDDP))
##D      DPcaterpillar(DPrandom(fitLDDP))
##D 
## End(Not run)




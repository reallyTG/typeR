library(MitISEM)


### Name: SeqMitISEM
### Title: Sequential approximation using Mixture of Student-t
###   distributions using Importance Sampling weighted Expectation
###   Maximization steps
### Aliases: SeqMitISEM

### ** Examples

## Not run: 
##D   # Sequential MitISEM application for SP500 data
##D   # Calculates 50 predictive likelihoods for the mGARCH(1,1) model, SP500 data
##D   # For details see: 'The R package MitISEM: Efficient and Robust Simulation Procedures 
##D   # for Bayesian Inference' by N. Basturk, S. Grassi, L. Hoogerheide, A. Opschoor, 
##D   # H.K. van Dijk.
##D   library(tseries)
##D   source("PostmGARCH.R") # posterior of the model under flat priors
##D   
##D   # load data
##D   prices <- as.vector(get.hist.quote("^GSPC",quote="AdjClose",start="1998-01-02",
##D     end="2002-12-26"))
##D   y <- 100 * (prices[-1] - prices[-length(prices)]) /  (prices[-length(prices)])
##D   # Prior and posterior densities for the mixture of GARCH(1,1) model with 
##D   # 2 mixture components
##D   prior.mGARCH<-function(omega, lambda, beta, alpha, p, mu, log=TRUE){
##D     c1 <- (omega>0 & omega<1 & beta>=0 & alpha>=0)
##D     c2 <- (beta + alpha< 1)
##D     c3 <- (lambda>=0 & lambda<=1)
##D     c4 <- (p>0.5 & p<1)
##D     c5 <- (mu>-1 & mu<1)
##D     r1 <- c1 & c2 & c3 & c4 & c5  
##D     r2 <- rep.int(-Inf,length(omega))
##D     tmp <- log(2) # ln(1 / ( p(beta,alpha) * p(p) * p(mu))
##D     r2[r1==TRUE] <- tmp
##D     if (!log)
##D       r2 <- exp(r2)
##D     cbind(r1,r2)
##D   }
##D   post.mGARCH <- function(theta, data, h1, log = TRUE){
##D     if (is.vector(theta))
##D       theta <- matrix(theta, nrow = 1)
##D     omega <- theta[,1]
##D     lambda <- theta[,2]
##D     beta <- theta[,3]
##D     alpha <- theta[,4]
##D     p <- theta[,5]
##D     mu <- theta[,6]
##D     N <- nrow(theta)
##D     pos <- 2:length(data) # # observation index (removing 1st)
##D     prior <- prior.mGARCH(omega=omega,lambda=lambda,beta=beta,alpha=alpha,
##D       p=p,mu=mu)
##D     d <- rep.int(-500000,N)#fixme
##D     for (i in 1:N){
##D       if (prior[i,1] == TRUE){
##D         h <- c(h1, omega[i] + alpha[i] * (data[pos-1]-mu[i])^2)
##D         for (j in pos){
##D           h[j] <- h[j] + beta[i] * h[j-1]
##D         }
##D         sigma <- 1 / (p[i] + ((1-p[i]) / lambda[i]))
##D         tmp1 <- dnorm(data[pos],mu[i],sqrt(h[pos]*sigma),log=T)
##D         tmp2 <- dnorm(data[pos],mu[i],sqrt(h[pos]*sigma/lambda[i]),log=T)     
##D         tmp <- log(p[i] * exp(tmp1) + (1-p[i]) * exp(tmp2))
##D         d[i] <- sum(tmp) + prior[i,2]
##D       }
##D     }
##D     if (!log) 
##D       d <- exp(d)
##D     as.numeric(d)
##D   }
##D   # define data subsample
##D   y.ss <- y[1:626] 
##D   # initial data variance
##D   h1   <- var(y) # initial variance
##D   N <- 1e3 # number of draws for predictive likelihood
##D   mu0 <- c(0.08, 0.37, 0.86, 0.03, 0.82, 0.03)  # initial parameters for MitISEM
##D   names(mu0) <- c("omega","lambda","beta","alpha","p","mu")
##D   set.seed(1234)
##D   cat("starting training subsample estimation", fill=TRUE) 
##D   mit.ss <- MitISEM(KERNEL = post.mGARCH, mu0 = mu0, data = y.ss, h1 = h1, 
##D     control=list(trace=TRUE))$mit
##D   cat("starting full sample estimation", fill=TRUE) 
##D   mit.fs <- MitISEM(KERNEL = post.mGARCH, mu0 = mu0, data = y,    h1 = h1, 
##D     control=list(trace=TRUE))$mit
##D   cat("starting predictive likelihood calculation", fill=TRUE) 
##D   N <- 1000  # number of simulations for IS 
##D   rep <- 50  # times to replicate application
##D   set.seed(1111)
##D   Mcompare.MitISEM <- PredLik(N,mit.fs,mit.ss,post.mGARCH,y,y.ss,h1=h1)
##D   # REPLICATE PRED LIKELIHOOD CALCULATION SEVERAL TIMES
##D   for(i in 2:rep){
##D     tmp <- PredLik(N,mit.fs,mit.ss,post.mGARCH,y,y.ss,h1=h1)
##D     Mcompare.MitISEM=mapply(rbind,Mcompare.MitISEM,tmp,SIMPLIFY=FALSE)
##D     if(i##D 
##D       cat("rep MitISEM",i,fill=TRUE);
##D   }
##D   # REPORT MEAN AND STANDARD DEVIATION
##D   Means.MitISEM <- mapply(colMeans,Mcompare.MitISEM,SIMPLIFY=FALSE)
##D   scales <- rep(0,2)
##D   tmp <- Means.MitISEM[[1]]
##D   while(floor(tmp)==0){
##D     scales[i] = scales[i]+1
##D     tmp = tmp * 10
##D   }
##D   # average predictive likelihood and NSE from 50 repetitions
##D   Adj.Mcompare.MitISEM = Mcompare.MitISEM
##D   NSE.MitISEM <- sqrt(apply(Adj.Mcompare.MitISEM[[1]],2,var)/rep)
##D   table1 <- c(colMeans(Adj.Mcompare.MitISEM$PL),NSE.MitISEM)
##D   table1 =  rbind(rep(Adj.Mcompare.MitISEM$scale[1],2),table1)
##D   rownames(table1) = c("scale (10^scale)","value")
##D   colnames(table1) = c("Pred Lik","NSE")
##D   cat("Pred. Likelihood and NSE values are multiplied by 10^(scale)", fill = TRUE)
##D   print(round(table1,4))
##D   cat("number of student t components for full sample and training sample estimation",
##D     fill = TRUE)
##D   table2 <- cbind(length(mit.ss$p), length(mit.fs$p))
##D   colnames(table2) <- c("full sample", "training sample")
##D   print(round(table2,0))
## End(Not run)




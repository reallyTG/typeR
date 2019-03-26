library(mixtools)


### Name: spRMM_SEM
### Title: Stochastic EM algorithm for semiparametric scaled mixture of
###   censored data
### Aliases: spRMM_SEM
### Keywords: file

### ** Examples

## Not run: 
##D n=500 # sample size
##D m=2 # nb components
##D lambda=c(0.4, 0.6) # parameters
##D meanlog=3; sdlog=0.5; scale=0.1
##D set.seed(12)
##D # simulate a scaled mixture of lognormals
##D x <- rlnormscalemix(n, lambda, meanlog, sdlog, scale)
##D cs=runif(n,20,max(x)+400) # Censoring (uniform) and incomplete data
##D t <- apply(cbind(x,cs),1,min)
##D d <- 1*(x <= cs)
##D tauxc <- 100*round( 1-mean(d),3)
##D cat(tauxc, "percents of data censored.\n")
##D 
##D c0 <- c(25, 180) # data-driven initial centers (visible modes)
##D sc0 <- 25/180    # and scaling
##D s <- spRMM_SEM(t, d, scaling = sc0, centers = c0, bw = 15, maxit = 100)
##D 
##D plotspRMM(s) # default
##D summary(s)   # S3 method for class "spRMM"
## End(Not run)




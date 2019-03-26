library(qcr)


### Name: npqcs.Q
### Title: Function to plot the Q chart
### Aliases: npqcs.Q npqcs.Q.default npqcs.Q.npqcd

### ** Examples

## Not run: 
##D  
##D ##
##D ##  Continuous data 
##D ##
##D library(qcr)
##D set.seed(12345)
##D mu<-c(0,0)
##D Sigma<- matrix(c(1,0,0,1),nrow = 2,ncol = 2)
##D u <- c(2,2)
##D S <- matrix(c(4,0,0,4),nrow = 2,ncol = 2)
##D G <- rmvnorm(540, mean = mu, sigma = Sigma)
##D x<- rmvnorm(40,mean=u,sigma = S)
##D x <- rbind(G[501:540,],x)
##D n <- 4 # samples
##D m <- 20  # measurements
##D k <- 2  # number of variables
##D x.a <- array(,dim=c(n,k,m))
##D for (i in 1:m){
##D x.a[,,i] <- x[(1+(i-1)*n):(i*n),] }
##D M <- G[1:500,]
##D data.npqcd <- npqcd(x.a,M)
##D str(data.npqcd)
##D res.npqcs <- npqcs.Q(data.npqcd,method = "Liu", alpha=0.025)
##D str(res.npqcs)
##D summary(res.npqcs)
##D plot(res.npqcs,title =" Q Control Chart")
## End(Not run)




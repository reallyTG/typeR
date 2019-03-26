library(qcr)


### Name: npqcs.r
### Title: Function to plot the r chart
### Aliases: npqcs.r npqcs.r.default npqcs.r.npqcd

### ** Examples

## Not run: 
##D ##
##D ##  Continuous data 
##D ##
##D ##
##D ##  Continuous data 
##D ##
##D library(qcr)
##D set.seed(356)
##D mu<-c(0,0)
##D Sigma<- matrix(c(1,0,0,1),nrow = 2,ncol = 2)
##D u <- c(2,2)
##D S <- matrix(c(4,0,0,4),nrow = 2,ncol = 2)
##D G <- rmvnorm(540, mean = mu, sigma = Sigma)
##D x<- rmvnorm(40,mean=u,sigma = S)
##D x <- rbind(G[501:540,],x)
##D M <- G[1:500,]
##D data.npqcd <- npqcd(x,M)
##D str(data.npqcd)
##D res.npqcs <- npqcs.r(data.npqcd,method = "Liu", alpha=0.025)
##D str(res.npqcs)
##D summary(res.npqcs)
##D plot(res.npqcs,title =" r Control Chart")  
## End(Not run)




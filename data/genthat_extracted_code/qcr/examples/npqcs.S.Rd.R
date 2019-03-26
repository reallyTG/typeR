library(qcr)


### Name: npqcs.S
### Title: Function to plot the S chart
### Aliases: npqcs.S npqcs.S.default npqcs.S.npqcd

### ** Examples

## Not run: 
##D ##
##D ##  Continuous data 
##D ##
##D set.seed(12345)
##D mu<-c(0,0)
##D Sigma<- matrix(c(1,0,0,1),nrow = 2,ncol = 2)
##D u <- c(2,2)
##D S <- matrix(c(4,0,0,4),nrow = 2,ncol = 2)
##D G <- rmvnorm(540, mean = mu, sigma = Sigma)
##D x<- rmvnorm(40,mean=u,sigma = S)
##D x.a <- rbind(G[501:540,],x)
##D M <- G[1:500,]
##D data.npqcd <- npqcd(x.a,M)
##D res.npqcs <- npqcs.S(data.npqcd,method = "Liu", alpha=0.05)
##D summary(res.npqcs)
##D plot(res.npqcs,title =" S Control Chart")
## End(Not run)




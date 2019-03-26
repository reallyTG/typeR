library(brainwaver)


### Name: const.var.list
### Title: Computation of the list of variance vectors
### Aliases: const.var.list
### Keywords: multivariate ts

### ** Examples

data(brain)
brain<-as.matrix(brain)

# WARNING : To process only the first five regions
brain<-brain[,1:5]



n.levels<-4
wave.var.list<-const.var.list(brain,n.levels=n.levels)

tot.regions <- dim(brain)[2]
n.series <- dim(brain)[1]

nb.num.regions <- 9
   num.regions <- round(runif(nb.num.regions,2,tot.regions))
    par(mfrow=c(3,3))
    for(k in 1:(nb.num.regions)){
	
        reg <- num.regions[k]

       var.vector<-matrix(0,4,3)
for(i in 1:n.levels){

	var.vector[i,1]<-(wave.var.list[[i]])[reg]
       	var.vector[i,2]<-(wave.var.list[[i+n.levels]])[reg]
       	var.vector[i,3]<-(wave.var.list[[i+2*n.levels]])[reg]
      }
        title <- num.regions[k]
        matplot(2^(0:(n.levels-1)),var.vector,main=title,type="b", 
                log="x", pch="*LU", xaxt="n", lty=1, col=c(1,4,4), 
                xlab="Wavelet Scale",ylab="Wavelet Variance")
        axis(side=1, at=2^(0:7))
        abline(h=0)
      }
  





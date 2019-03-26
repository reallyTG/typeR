library(brainwaver)


### Name: const.cor.list
### Title: Computation of the list of correlation matrices
### Aliases: const.cor.list
### Keywords: multivariate ts

### ** Examples

data(brain)
brain<-as.matrix(brain)
# WARNING : To process only the first five regions
brain<-brain[,1:5]


n.levels<-4
wave.cor.list<-const.cor.list(brain,n.levels=n.levels)

tot.regions <- dim(brain)[2]
n.series <- dim(brain)[1]
col.regions<-1

nb.comp.regions <- 8
    comp.regions <- round(runif(nb.comp.regions,2,tot.regions))
    sym.region <- col.regions+1

comp.regions <- c(sym.region,comp.regions)

    name.ps <- "example-1.ps"
    postscript(name.ps)
    par(mfrow=c(3,3))
    for(k in 1:(nb.comp.regions+1)){
	
        reg <- comp.regions[k]


       cor.vector<-matrix(0,4,3)
	for(i in 1:n.levels){

       cor.vector[i,1]<-(wave.cor.list[[i]])[1,reg]
       cor.vector[i,2]<-(wave.cor.list[[i+n.levels]])[1,reg]
       cor.vector[i,3]<-(wave.cor.list[[i+2*n.levels]])[1,reg]

}

         title <- paste("1 -- ",comp.regions[k],sep="")
        matplot(2^(0:(n.levels-1)),cor.vector,main=title,type="b", 
                 log="x", pch="*LU", xaxt="n", lty=1, col=c(1,4,4), 
                 xlab="Wavelet Scale",ylab="Wavelet Covariance",ylim=c(-0.5,1))
        axis(side=1, at=2^(0:7))
        abline(h=0)
      }
    dev.off()










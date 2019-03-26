library(fitODBOD)


### Name: dKumBin
### Title: Kumaraswamy Binomial Distribution
### Aliases: dKumBin

### ** Examples

## Not run: 
##D #plotting the random variables and probability values
##D col<-rainbow(5)
##D a<-c(1,2,5,10,.85)
##D plot(0,0,main="Kumaraswamy binomial probability function graph",xlab="Binomial random variable",
##D ylab="Probability function values",xlim = c(0,10),ylim = c(0,0.5))
##D 
##D for (i in 1:5)
##D {
##D lines(0:10,dKumBin(0:10,10,a[i],a[i])$pdf,col = col[i],lwd=2.85)
##D points(0:10,dKumBin(0:10,10,a[i],a[i])$pdf,col = col[i],pch=16)
##D }
## End(Not run)
dKumBin(0:10,10,4,2)$pdf  #extracting the pdf values
dKumBin(0:10,10,4,2)$mean #extracting the mean
dKumBin(0:10,10,4,2)$var  #extracting the variance
dKumBin(0:10,10,4,2)$over.dis.para #extracting the over dispersion value

## Not run: 
##D #plotting the random variables and cumulative probability values
##D col<-rainbow(5)
##D a<-c(1,2,5,10,.85)
##D plot(0,0,main="Cumulative probability function graph",xlab="Binomial random variable",
##D ylab="Cumulative probability function values",xlim = c(0,10),ylim = c(0,1))
##D 
##D for (i in 1:5)
##D {
##D lines(0:10,pKumBin(0:10,10,a[i],a[i]),col = col[i])
##D points(0:10,pKumBin(0:10,10,a[i],a[i]),col = col[i])
##D }
## End(Not run)
pKumBin(0:10,10,4,2)    #acquiring the cumulative probability values





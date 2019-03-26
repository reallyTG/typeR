library(fitODBOD)


### Name: dGHGBB
### Title: Gaussian Hypergeometric Generalized Beta Binomial Distribution
### Aliases: dGHGBB

### ** Examples

#plotting the random variables and probability values
col<-rainbow(6)
a<-c(.1,.2,.3,1.5,2.1,3)
plot(0,0,main="GHGBB probability function graph",xlab="Binomial random variable",
ylab="Probability function values",xlim = c(0,7),ylim = c(0,0.9))
for (i in 1:6)
{
lines(0:7,dGHGBB(0:7,7,1+a[i],0.3,1+a[i])$pdf,col = col[i],lwd=2.85)
points(0:7,dGHGBB(0:7,7,1+a[i],0.3,1+a[i])$pdf,col = col[i],pch=16)
}
dGHGBB(0:7,7,1.3,0.3,1.3)$pdf      #extracting the pdf values
dGHGBB(0:7,7,1.3,0.3,1.3)$mean     #extracting the mean
dGHGBB(0:7,7,1.3,0.3,1.3)$var      #extracting the variance
dGHGBB(0:7,7,1.3,0.3,1.3)$over.dis.par  #extracting the over dispersion value

#plotting the random variables and cumulative probability values
col<-rainbow(4)
a<-c(1,2,5,10)
plot(0,0,main="Cumulative probability function graph",xlab="Binomial random variable",
ylab="Cumulative probability function values",xlim = c(0,7),ylim = c(0,1))
for (i in 1:4)
{
lines(0:7,pGHGBB(0:7,7,1+a[i],0.3,1+a[i]),col = col[i])
points(0:7,pGHGBB(0:7,7,1+a[i],0.3,1+a[i]),col = col[i])
}

pGHGBB(0:7,7,1.3,0.3,1.3)     #acquiring the cumulative probability values





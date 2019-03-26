library(fitODBOD)


### Name: dBetaCorrBin
### Title: Beta-Correlated Binomial Distribution
### Aliases: dBetaCorrBin

### ** Examples

#plotting the random variables and probability values
col<-rainbow(5)
a<-c(9.0,10,11,12,13)
b<-c(8.0,8.1,8.2,8.3,8.4)
plot(0,0,main="Beta-Correlated binomial probability function graph",xlab="Binomial random variable",
ylab="Probability function values",xlim = c(0,10),ylim = c(0,0.5))
for (i in 1:5)
{
lines(0:10,dBetaCorrBin(0:10,10,0.001,a[i],b[i])$pdf,col = col[i],lwd=2.85)
points(0:10,dBetaCorrBin(0:10,10,0.001,a[i],b[i])$pdf,col = col[i],pch=16)
}
dBetaCorrBin(0:10,10,0.001,10,13)$pdf      #extracting the pdf values
dBetaCorrBin(0:10,10,0.001,10,13)$mean     #extracting the mean
dBetaCorrBin(0:10,10,0.001,10,13)$var      #extracting the variance
dBetaCorrBin(0:10,10,0.001,10,13)$corr     #extracting the correlation
dBetaCorrBin(0:10,10,0.001,10,13)$mincorr  #extracting the minimum correlation value
dBetaCorrBin(0:10,10,0.001,10,13)$maxcorr  #extracting the maximum correlation value

#plotting the random variables and cumulative probability values
col<-rainbow(5)
a<-c(9.0,10,11,12,13)
b<-c(8.0,8.1,8.2,8.3,8.4)
plot(0,0,main="Beta-Correlated binomial probability function graph",xlab="Binomial random variable",
ylab="Probability function values",xlim = c(0,10),ylim = c(0,1))
for (i in 1:5)
{
lines(0:10,pBetaCorrBin(0:10,10,0.001,a[i],b[i]),col = col[i],lwd=2.85)
points(0:10,pBetaCorrBin(0:10,10,0.001,a[i],b[i]),col = col[i],pch=16)
}
pBetaCorrBin(0:10,10,0.001,10,13)      #acquiring the cumulative probability values





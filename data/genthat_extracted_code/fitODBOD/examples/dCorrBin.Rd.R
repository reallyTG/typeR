library(fitODBOD)


### Name: dCorrBin
### Title: Correlated Binomial Distribution
### Aliases: dCorrBin

### ** Examples

#plotting the random variables and probability values
col<-rainbow(5)
a<-c(0.58,0.59,0.6,0.61,0.62)
b<-c(0.022,0.023,0.024,0.025,0.026)
plot(0,0,main="Correlated binomial probability function graph",xlab="Binomial random variable",
ylab="Probability function values",xlim = c(0,10),ylim = c(0,0.5))
for (i in 1:5)
{
lines(0:10,dCorrBin(0:10,10,a[i],b[i])$pdf,col = col[i],lwd=2.85)
points(0:10,dCorrBin(0:10,10,a[i],b[i])$pdf,col = col[i],pch=16)
}
dCorrBin(0:10,10,0.58,0.022)$pdf      #extracting the pdf values
dCorrBin(0:10,10,0.58,0.022)$mean     #extracting the mean
dCorrBin(0:10,10,0.58,0.022)$var      #extracting the variance
dCorrBin(0:10,10,0.58,0.022)$corr     #extracting the correlation
dCorrBin(0:10,10,0.58,0.022)$mincorr  #extracting the minimum correlation value
dCorrBin(0:10,10,0.58,0.022)$maxcorr  #extracting the maximum correlation value

#plotting the random variables and cumulative probability values
col<-rainbow(5)
a<-c(0.58,0.59,0.6,0.61,0.62)
b<-c(0.022,0.023,0.024,0.025,0.026)
plot(0,0,main="Correlated binomial probability function graph",xlab="Binomial random variable",
ylab="Probability function values",xlim = c(0,10),ylim = c(0,1))
for (i in 1:5)
{
lines(0:10,pCorrBin(0:10,10,a[i],b[i]),col = col[i],lwd=2.85)
points(0:10,pCorrBin(0:10,10,a[i],b[i]),col = col[i],pch=16)
}
pCorrBin(0:10,10,0.58,0.022)      #acquiring the cumulative probability values





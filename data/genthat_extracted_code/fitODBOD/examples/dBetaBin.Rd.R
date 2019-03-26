library(fitODBOD)


### Name: dBetaBin
### Title: Beta-Binomial Distribution
### Aliases: dBetaBin

### ** Examples

#plotting the random variables and probability values
col<-rainbow(5)
a<-c(1,2,5,10,0.2)
plot(0,0,main="Beta-binomial probability function graph",xlab="Binomial random variable",
ylab="Probability function values",xlim = c(0,10),ylim = c(0,0.5))
for (i in 1:5)
{
lines(0:10,dBetaBin(0:10,10,a[i],a[i])$pdf,col = col[i],lwd=2.85)
points(0:10,dBetaBin(0:10,10,a[i],a[i])$pdf,col = col[i],pch=16)
}

dBetaBin(0:10,10,4,.2)$pdf    #extracting the pdf values
dBetaBin(0:10,10,4,.2)$mean   #extracting the mean
dBetaBin(0:10,10,4,.2)$var    #extracting the variance
dBetaBin(0:10,10,4,.2)$over.dis.para  #extracting the over dispersion value

#plotting the random variables and cumulative probability values
col<-rainbow(4)
a<-c(1,2,5,10)
plot(0,0,main="Cumulative probability function graph",xlab="Binomial random variable",
ylab="Cumulative probability function values",xlim = c(0,10),ylim = c(0,1))
for (i in 1:4)
{
lines(0:10,pBetaBin(0:10,10,a[i],a[i]),col = col[i])
points(0:10,pBetaBin(0:10,10,a[i],a[i]),col = col[i])
}
pBetaBin(0:10,10,4,.2)   #acquiring the cumulative probability values





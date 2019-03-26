library(fitODBOD)


### Name: dMultiBin
### Title: Multiplicative Binomial Distribution
### Aliases: dMultiBin

### ** Examples

#plotting the random variables and probability values
col<-rainbow(5)
a<-c(0.58,0.59,0.6,0.61,0.62)
b<-c(0.022,0.023,0.024,0.025,0.026)
plot(0,0,main="Multiplicative binomial probability function graph",xlab="Binomial random variable",
ylab="Probability function values",xlim = c(0,10),ylim = c(0,0.5))
for (i in 1:5)
{
lines(0:10,dMultiBin(0:10,10,a[i],1+b[i])$pdf,col = col[i],lwd=2.85)
points(0:10,dMultiBin(0:10,10,a[i],1+b[i])$pdf,col = col[i],pch=16)
}
dMultiBin(0:10,10,.58,10.022)$pdf   #extracting the pdf values
dMultiBin(0:10,10,.58,10.022)$mean   #extracting the mean
dMultiBin(0:10,10,.58,10.022)$var   #extracting the variance


#plotting random variables and cumulative probability values
col<-rainbow(5)
a<-c(0.58,0.59,0.6,0.61,0.62)
b<-c(0.022,0.023,0.024,0.025,0.026)
plot(0,0,main="Multiplicative binomial probability function graph",xlab="Binomial random variable",
ylab="Probability function values",xlim = c(0,10),ylim = c(0,1))
for (i in 1:5)
{
lines(0:10,pMultiBin(0:10,10,a[i],1+b[i]),col = col[i],lwd=2.85)
points(0:10,pMultiBin(0:10,10,a[i],1+b[i]),col = col[i],pch=16)
}
pMultiBin(0:10,10,.58,10.022)     #acquiring the cumulative probability values





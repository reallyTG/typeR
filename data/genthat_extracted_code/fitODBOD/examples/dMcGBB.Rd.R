library(fitODBOD)


### Name: dMcGBB
### Title: McDonald Generalized Beta Binomial Distribution
### Aliases: dMcGBB

### ** Examples

#plotting the random variables and probability values
col<-rainbow(5)
a<-c(1,2,5,10,0.6)
plot(0,0,main="Mcdonald generalized beta-binomial probability function graph",
xlab="Binomial random variable",ylab="Probability function values",xlim = c(0,10),ylim = c(0,0.5))
for (i in 1:5)
{
lines(0:10,dMcGBB(0:10,10,a[i],2.5,a[i])$pdf,col = col[i],lwd=2.85)
points(0:10,dMcGBB(0:10,10,a[i],2.5,a[i])$pdf,col = col[i],pch=16)
}
dMcGBB(0:10,10,4,2,1)$pdf             #extracting the pdf values
dMcGBB(0:10,10,4,2,1)$mean            #extracting the mean
dMcGBB(0:10,10,4,2,1)$var             #extracting the variance
dMcGBB(0:10,10,4,2,1)$over.dis.para   #extracting the over dispersion value

#plotting the random variables and cumulative probability values
col<-rainbow(4)
a<-c(1,2,5,10)
plot(0,0,main="Cumulative probability function graph",xlab="Binomial random variable",
ylab="Cumulative probability function values",xlim = c(0,10),ylim = c(0,1))
for (i in 1:4)
{
lines(0:10,pMcGBB(0:10,10,a[i],a[i],2),col = col[i])
points(0:10,pMcGBB(0:10,10,a[i],a[i],2),col = col[i])
}
pMcGBB(0:10,10,4,2,1)       #acquiring the cumulative probability values





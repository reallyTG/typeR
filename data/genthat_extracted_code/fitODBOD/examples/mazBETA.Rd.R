library(fitODBOD)


### Name: mazBETA
### Title: Beta Distribution
### Aliases: mazBETA

### ** Examples

#plotting the random variables and probability values
col<-rainbow(4)
a<-c(1,2,5,10)
plot(0,0,main="Probability density graph",xlab="Random variable",ylab="Probability density values",
xlim = c(0,1),ylim = c(0,4))
for (i in 1:4)
{
lines(seq(0,1,by=0.01),dBETA(seq(0,1,by=0.01),a[i],a[i])$pdf,col = col[i])
}

dBETA(seq(0,1,by=0.01),2,3)$pdf   #extracting the pdf values
dBETA(seq(0,1,by=0.01),2,3)$mean  #extracting the mean
dBETA(seq(0,1,by=0.01),2,3)$var   #extracting the variance

#plotting the random variables and cumulative probability values
col<-rainbow(4)
a<-c(1,2,5,10)
plot(0,0,main="Cumulative density graph",xlab="Random variable",ylab="Cumulative density values",
xlim = c(0,1),ylim = c(0,1))
for (i in 1:4)
{
lines(seq(0,1,by=0.01),pBETA(seq(0,1,by=0.01),a[i],a[i]),col = col[i])
}

pBETA(seq(0,1,by=0.01),2,3)   #acquiring the cumulative probability values
mazBETA(1.4,3,2)              #acquiring the moment about zero values
mazBETA(2,3,2)-mazBETA(1,3,2)^2 #acquiring the variance for a=3,b=2
#only the integer value of moments is taken here because moments cannot be decimal
mazBETA(1.9,5.5,6)





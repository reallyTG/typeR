library(fitODBOD)


### Name: pKUM
### Title: Kumaraswamy Distribution
### Aliases: pKUM

### ** Examples

#plotting the random variables and probability values
col<-rainbow(4)
a<-c(1,2,5,10)
plot(0,0,main="Probability density graph",xlab="Random variable",ylab="Probability density values",
xlim = c(0,1),ylim = c(0,6))
for (i in 1:4)
{
lines(seq(0,1,by=0.01),dKUM(seq(0,1,by=0.01),a[i],a[i])$pdf,col = col[i])
}
dKUM(seq(0,1,by=0.01),2,3)$pdf   #extracting the probability values
dKUM(seq(0,1,by=0.01),2,3)$mean  #extracting the mean
dKUM(seq(0,1,by=0.01),2,3)$var   #extracting the variance

#plotting the random variables and cumulative probability values
col<-rainbow(4)
a<-c(1,2,5,10)
plot(0,0,main="Cumulative density graph",xlab="Random variable",ylab="Cumulative density values",
xlim = c(0,1),ylim = c(0,1))
for (i in 1:4)
{
lines(seq(0,1,by=0.01),pKUM(seq(0,1,by=0.01),a[i],a[i]),col = col[i])
}
pKUM(seq(0,1,by=0.01),2,3)    #acquiring the cumulative probability values
mazKUM(1.4,3,2)               #acquiring the moment about zero values
mazKUM(2,2,3)-mazKUM(1,2,3)^2  #acquiring the variance for a=2,b=3
#only the integer value of moments is taken here because moments cannot be decimal
mazKUM(1.9,5.5,6)





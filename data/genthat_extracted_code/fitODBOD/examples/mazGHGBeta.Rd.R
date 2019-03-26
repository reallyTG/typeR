library(fitODBOD)


### Name: mazGHGBeta
### Title: Gaussian Hypergeometric Generalized Beta Distribution
### Aliases: mazGHGBeta

### ** Examples

#plotting the random variables and probability values
col<-rainbow(5)
a<-c(.1,.2,.3,1.5,2.15)
plot(0,0,main="Probability density graph",xlab="Random variable",ylab="Probability density values",
xlim = c(0,1),ylim = c(0,10))
for (i in 1:5)
{
lines(seq(0,1,by=0.001),dGHGBeta(seq(0,1,by=0.001),7,1+a[i],0.3,1+a[i])$pdf,col = col[i])
}
dGHGBeta(seq(0,1,by=0.01),7,1.6312,0.3913,0.6659)$pdf   #extracting the pdf values
dGHGBeta(seq(0,1,by=0.01),7,1.6312,0.3913,0.6659)$mean  #extracting the mean
dGHGBeta(seq(0,1,by=0.01),7,1.6312,0.3913,0.6659)$var   #extracting the variance

#plotting the random variables and cumulative probability values
col<-rainbow(6)
a<-c(.1,.2,.3,1.5,2.1,3)
plot(0,0,main="Cumulative density graph",xlab="Random variable",ylab="Cumulative density values",
xlim = c(0,1),ylim = c(0,1))
for (i in 1:6)
{
lines(seq(0.01,1,by=0.001),pGHGBeta(seq(0.01,1,by=0.001),7,1+a[i],0.3,1+a[i]),col=col[i])
}

pGHGBeta(seq(0,1,by=0.01),7,1.6312,0.3913,0.6659) #acquiring the cumulative probability values
mazGHGBeta(1.4,7,1.6312,0.3913,0.6659)            #acquiring the moment about zero values

#acquiring the variance for a=1.6312,b=0.3913,c=0.6659
mazGHGBeta(2,7,1.6312,0.3913,0.6659)-mazGHGBeta(1,7,1.6312,0.3913,0.6659)^2
#only the integer value of moments is taken here because moments cannot be decimal
mazGHGBeta(1.9,15,5,6,1)





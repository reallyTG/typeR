library(fitODBOD)


### Name: mazGBeta1
### Title: Generalized Beta Type-1 Distribution
### Aliases: mazGBeta1

### ** Examples

#plotting the random variables and probability values
col<-rainbow(5)
a<-c(.1,.2,.3,1.5,2.15)
plot(0,0,main="Probability density graph",xlab="Random variable",ylab="Probability density values",
xlim = c(0,1),ylim = c(0,10))
for (i in 1:5)
{
lines(seq(0,1,by=0.001),dGBeta1(seq(0,1,by=0.001),a[i],1,2*a[i])$pdf,col = col[i])
}
dGBeta1(seq(0,1,by=0.01),2,3,1)$pdf    #extracting the pdf values
dGBeta1(seq(0,1,by=0.01),2,3,1)$mean   #extracting the mean
dGBeta1(seq(0,1,by=0.01),2,3,1)$var    #extracting the variance

pGBeta1(0.04,2,3,4)        #acquiring the cdf values for a=2,b=3,c=4
mazGBeta1(1.4,3,2,2)              #acquiring the moment about zero values
mazGBeta1(2,3,2,2)-mazGBeta1(1,3,2,2)^2        #acquiring the variance for a=3,b=2,c=2
#only the integer value of moments is taken here because moments cannot be decimal
mazGBeta1(3.2,3,2,2)





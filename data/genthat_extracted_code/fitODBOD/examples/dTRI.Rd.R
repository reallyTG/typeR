library(fitODBOD)


### Name: dTRI
### Title: Triangular Distribution bounded between [0,1]
### Aliases: dTRI

### ** Examples

#plotting the random variables and probability values
col<-rainbow(4)
x<-seq(0.2,0.8,by=0.2)
plot(0,0,main="Probability density graph",xlab="Random variable",
ylab="Probability density values",xlim = c(0,1),ylim = c(0,3))
for (i in 1:4)
{
lines(seq(0,1,by=0.01),dTRI(seq(0,1,by=0.01),x[i])$pdf,col = col[i])
}

dTRI(seq(0,1,by=0.05),0.3)$pdf     #extracting the pdf values
dTRI(seq(0,1,by=0.01),0.3)$mean    #extracting the mean
dTRI(seq(0,1,by=0.01),0.3)$var     #extracting the variance

#plotting the random variables and cumulative probability values
col<-rainbow(4)
x<-seq(0.2,0.8,by=0.2)
plot(0,0,main="Cumulative density graph",xlab="Random variable",
ylab="Cumulative density values",xlim = c(0,1),ylim = c(0,1))
for (i in 1:4)
{
lines(seq(0,1,by=0.01),pTRI(seq(0,1,by=0.01),x[i]),col = col[i])
}

pTRI(seq(0,1,by=0.05),0.3)      #acquiring the cumulative probability values
mazTRI(1.4,.3)                  #acquiring the moment about zero values
mazTRI(2,.3)-mazTRI(1,.3)^2     #variance for when is mode 0.3
#only the integer value of moments is taken here because moments cannot be decimal
mazTRI(1.9,0.5)





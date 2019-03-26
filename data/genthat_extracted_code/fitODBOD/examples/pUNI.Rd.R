library(fitODBOD)


### Name: pUNI
### Title: Uniform Distribution bounded between [0,1]
### Aliases: pUNI

### ** Examples

#plotting the random variables and probability values
plot(seq(0,1,by=0.01),dUNI(seq(0,1,by=0.01))$pdf,type = "l",main="Probability density graph",
xlab="Random variable",ylab="Probability density values")
dUNI(seq(0,1,by=0.05))$pdf     #extract the pdf values
dUNI(seq(0,1,by=0.01))$mean    #extract the mean
dUNI(seq(0,1,by=0.01))$var     #extract the variance

#plotting the random variables and cumulative probability values
plot(seq(0,1,by=0.01),pUNI(seq(0,1,by=0.01)),type = "l",main="Cumulative density graph",
xlab="Random variable",ylab="Cumulative density values")
pUNI(seq(0,1,by=0.05))     #acquiring the cumulative probability values

mazUNI(c(1,2,3))    #acquiring the moment about zero values
#only the integer value of moments is taken here because moments cannot be decimal
mazUNI(1.9)





library(fitODBOD)


### Name: pUniBin
### Title: Uniform Binomial Distribution
### Aliases: pUniBin

### ** Examples

#plotting the binomial random variables and probability values
plot(0:10,dUniBin(0:10,10)$pdf,type="l",main="Uniform binomial probability function graph",
xlab=" Binomial random variable",ylab="Probability function values")
points(0:10,dUniBin(0:10,10)$pdf)
dUniBin(0:300,300)$pdf  #extracting the pdf values
dUniBin(0:10,10)$mean   #extracting the mean
dUniBin(0:10,10)$var    #extracting the variance
dUniBin(0:10,10)$over.dis.para  #extracting the over dispersion

#plotting the binomial random variables and cumulative probability values
plot(0:10,pUniBin(0:10,10),type="l",main="Cumulative probability function graph",
xlab=" Binomial random variable",ylab="Cumulative probability function values")
points(0:10,pUniBin(0:10,10))

pUniBin(0:15,15)       #acquiring the cumulative probability values





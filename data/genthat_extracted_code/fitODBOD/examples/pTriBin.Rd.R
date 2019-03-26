library(fitODBOD)


### Name: pTriBin
### Title: Triangular Binomial Distribution
### Aliases: pTriBin

### ** Examples

#plotting the random variables and probability values
col<-rainbow(7)
x<-seq(0.1,0.7,by=0.1)
plot(0,0,main="Triangular binomial probability function graph",xlab="Binomial random variable",
ylab="Probability function values",xlim = c(0,10),ylim = c(0,.3))
for (i in 1:7)
{
lines(0:10,dTriBin(0:10,10,x[i])$pdf,col = col[i],lwd=2.85)
points(0:10,dTriBin(0:10,10,x[i])$pdf,col = col[i],pch=16)
}

dTriBin(0:10,10,.4)$pdf        #extracting the pdf values
dTriBin(0:10,10,.4)$mean       #extracting the mean
dTriBin(0:10,10,.4)$var        #extracting the variance
dTriBin(0:10,10,.4)$over.dis.para  #extracting the over dispersion value

#plotting the random variables and cumulative probability values
col<-rainbow(7)
x<-seq(0.1,0.7,by=0.1)
plot(0,0,main="Triangular binomial probability function graph",xlab="Binomial random variable",
ylab="Probability function values",xlim = c(0,10),ylim = c(0,1))
for (i in 1:7)
{
lines(0:10,pTriBin(0:10,10,x[i]),col = col[i],lwd=2.85)
points(0:10,pTriBin(0:10,10,x[i]),col = col[i],pch=16)
}
pTriBin(0:10,10,.4)    #acquiring the cumulative probability values





library(fma)


### Name: ibm
### Title: IBM sales and profit
### Aliases: ibm
### Keywords: datasets

### ** Examples
par(mfrow=c(2,1))
plot(ibm[,1],xlim=c(1954,2000),ylim=c(0,200),
    ylab="Sales (billions of $)",xlab="Year",type="o")
lines(ibm[,3],col=2,type="o")
plot(ibm[,2],xlim=c(1954,2000),ylim=c(-10,30),
    ylab="Profits (billions of $)",xlab="Year",type="o")
lines(ibm[,4],col=2,type="o")




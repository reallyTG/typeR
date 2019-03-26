library(popbio)


### Name: extCDF
### Title: Count-based extinction time cumulative distribution function
### Aliases: extCDF
### Keywords: survey

### ** Examples

data(grizzly)
logN<-log(grizzly$N[-1]/grizzly$N[-39])
mu<-mean(logN)
sig2<-var(logN)
## grizzly cdf (log scale)
ex<-extCDF(mu, sig2, Nc=99, Ne=20)
plot(ex, log='y', type='l', pch=16, col="blue", yaxt='n',
xlab="Years", ylab="Quasi-extinction probability",
main="Yellowstone Grizzly bears")
pwrs<-seq(-15,-5,5)
axis(2, at = 10^pwrs, labels=parse(text=paste("10^", pwrs, sep = "")),
las=1)
##plot like fig 3.10  (p 90)
n<-seq(20, 100, 2)
exts<-numeric(length(n))
for (i in 1:length(n) )
{
   ex<-extCDF(mu, sig2, Nc=n[i], Ne=20)
   exts[i]<-ex[50]
}
plot(n, exts, type='l', las=1,
xlab="Current population size",
ylab="Probability of quasi-extinction by year 50")




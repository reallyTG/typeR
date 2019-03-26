library(BayesDA)


### Name: schiz
### Title: Data on Response Times for Scizophrenics and non-Schizophrenics
### Aliases: schiz
### Keywords: datasets

### ** Examples

data(schiz)
str(schiz)
# Making figure 18.1 in the book:
opar <- par(no.readonly=TRUE)
par( mar=c(2.0, 1,1,1))
par(mfrow=c(5,4))
for (i in 1:11) hist( log(schiz[,i]), main="", xlab="", ylab="", xlim=c(5.4, 7.5))
par( mfg=c(4, 1))
for (i in 1:6) hist( log(schiz[,11+i]), main="", xlab="", ylab="", xlim=c(5.4, 7.5))
par(opar)




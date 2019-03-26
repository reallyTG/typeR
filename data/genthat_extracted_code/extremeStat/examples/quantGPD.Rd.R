library(extremeStat)


### Name: quantGPD
### Title: Fast GPD quantile estimate
### Aliases: quantGPD
### Keywords: distribution robust univar

### ** Examples

data(annMax)
quantile(annMax, 0.99)
quantGPD(annMax, 0.99)

## Not run: 
##D  # Excluded from CRAN checks to reduce checking time
##D data(rain, package="ismev") ;  rain <- rain[rain>0]
##D hist(rain, breaks=50, col=7)
##D tr <- seq(0,0.999, len=50)
##D qu <- pbapply::pbsapply(tr, quantGPD, x=rain, probs=c(0.9,0.99,0.999) ) # 30 s
##D plot(tr, qu[3,], ylim=range(rain), las=1, type="l")
##D lines(tr, qu[2,], col=2); lines(tr, qu[1,], col=4)
##D 
##D tr <- seq(0.88,0.999, len=50)
##D qu <- pbapply::pbsapply(tr, quantGPD, x=rain, probs=c(0.9,0.99,0.999) ) # 5 s
##D plot(tr, qu[3,], ylim=range(rain), las=1, type="l")
##D lines(tr, qu[2,], col=2); lines(tr, qu[1,], col=4);
##D tail(qu["n",])
##D 
##D library(microbenchmark)
##D data(rain, package="ismev"); rain <- rain[rain>0]
##D mb <- microbenchmark(quantGPD(rain[1:200], truncate=0.8, probs=0.99, addn=F),
##D distLquantile(rain[1:200], sel="gpa", emp=F, truncate=0.8, quiet=T, probs=0.99)[1,1]
##D )
##D boxplot(mb)
##D # since computing the lmoments takes most of the computational time,
##D # there's not much to optimize in large samples like n=2000
##D 
## End(Not run)





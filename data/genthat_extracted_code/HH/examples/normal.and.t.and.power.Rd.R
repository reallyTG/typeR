library(HH)


### Name: NormalAndTPower
### Title: Construct a power graph based on the NTplot.
### Aliases: NormalAndTPower powerplot powerplot.NormalAndTplot 'power
###   curve' 'beta curve' 'operating characteristic curve'
### Keywords: hplot

### ** Examples


nt <- NTplot(mean0=2, mean1=4, sd=3, n=20, xlim=c(-.1, 6.1), xbar=3.5)
powerplot(nt)

## Not run: 
##D tt <- NTplot(mean0=2, mean1=4, sd=3, n=20, xlim=c(-.1, 6.1), xbar=3.5, df=4, distribution.name="t")
##D powerplot(tt)
##D 
##D ntc <- NTplot(xbar=2, sd=3, n=20, xlim=c(-.1, 4.1), type="confidence",
##D               alpha.left=.025, alpha.right=.025)
##D ntc
##D try(powerplot(ntc))
## End(Not run)




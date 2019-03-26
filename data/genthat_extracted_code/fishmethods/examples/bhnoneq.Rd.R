library(fishmethods)


### Name: bhnoneq
### Title: Length-based Beverton-Holt Nonequilibrium Z Estimator
### Aliases: bhnoneq
### Keywords: misc

### ** Examples
data(goosefish)
bhnoneq(year=goosefish$year,mlen=goosefish$mlen, ss=goosefish$ss,
K=0.108,Linf=126,Lc=30,nbreaks=1,styrs=c(1982),stZ=c(0.1,0.3))




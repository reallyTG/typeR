library(sparr)


### Name: LIK.density
### Title: Cross-validation bandwidths for spatial kernel density estimates
### Aliases: LIK.density LSCV.density

### ** Examples


data(pbc)
pbccas <- split(pbc)$case

LIK.density(pbccas)
LSCV.density(pbccas)

## No test: 
#* FIXED 

# custom limits
LIK.density(pbccas,hlim=c(0.01,4))
LSCV.density(pbccas,hlim=c(0.01,4))

# disable edge correction
LIK.density(pbccas,hlim=c(0.01,4),edge=FALSE)
LSCV.density(pbccas,hlim=c(0.01,4),edge=FALSE)

# obtain objective function
hcv <- LIK.density(pbccas,hlim=c(0.01,4),auto.optim=FALSE)
plot(hcv);abline(v=hcv[which.max(hcv[,2]),1],lty=2,col=2)

#* ADAPTIVE
LIK.density(pbccas,type="adaptive")
LSCV.density(pbccas,type="adaptive")
 
# change pilot bandwidth used
LIK.density(pbccas,type="adaptive",hp=2)
LSCV.density(pbccas,type="adaptive",hp=2)
## End(No test) 





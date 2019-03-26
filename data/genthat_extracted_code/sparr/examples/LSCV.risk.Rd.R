library(sparr)


### Name: LSCV.risk
### Title: Jointly optimal bandwidth selection for the spatial relative
###   risk function
### Aliases: LSCV.risk

### ** Examples


## No test: 

data(pbc)
pbccas <- split(pbc)$case
pbccon <- split(pbc)$control

# FIXED (for common h)

LSCV.risk(pbccas,pbccon)
LSCV.risk(pbccas,pbccon,method="hazelton")
hcv <- LSCV.risk(pbccas,pbccon,method="davies",auto.optim=FALSE)
plot(hcv[,1],log(hcv[,2]));abline(v=hcv[which.min(hcv[,2]),1],col=2,lty=2)


# ADAPTIVE (for common h0)

LSCV.risk(pbccas,pbccon,type="adaptive")

# change pilot bandwidths used
LSCV.risk(pbccas,pbccon,type="adaptive",hp=c(OS(pbccas)/2,OS(pbccon)/2))

# specify pooled-data symmetric relative risk estimator 
LSCV.risk(pbccas,pbccon,type="adaptive",hp=OS(pbc),pilot.symmetry="pooled")

# as above, for Hazelton selector
LSCV.risk(pbccas,pbccon,type="adaptive",method="hazelton")
LSCV.risk(pbccas,pbccon,type="adaptive",method="hazelton",hp=c(OS(pbccas)/2,OS(pbccon)/2))
LSCV.risk(pbccas,pbccon,type="adaptive",method="hazelton",hp=OS(pbc),pilot.symmetry="pooled")
## End(No test)





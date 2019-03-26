library(spcadjust)


### Name: SPCShew-class
### Title: Shewhart charts.
### Aliases: SPCShew-class

### ** Examples

X<-rnorm(100);
##calibrate to ARL 100
chartShew <- new("SPCShew",model=SPCModelNormal(),twosided=TRUE)
## Not run: 
##D SPCproperty(data=X,nrep=500,
##D             property="calARL",chart=chartShew,params=list(target=100),
##D             covprob=c(0.7,0.9))
##D 
##D chartShewOneSided <- new("SPCShew",model=SPCModelNormal(),twosided=FALSE)
##D SPCproperty(data=X,nrep=500,
##D             property="calARL",chart=chartShewOneSided,
##D             params=list(target=100),covprob=c(0.7,0.9))
##D 
##D ##calibrate to a hitting probability of 0.01 in 100 steps
##D SPCproperty(data=X,nrep=500,
##D             property="calhitprob",
##D             chart=chartShew,params=list(target=0.01,nsteps=100))
##D SPCproperty(data=X,nrep=500,
##D             property="calhitprob",chart=chartShewOneSided,params=list(target=0.01,nsteps=100))
##D 
##D ## work out  for ARL for a fixed threshold of 4
##D SPCproperty(data=X,nrep=500,
##D             property="ARL",chart=chartShew,params=list(threshold=4))
##D SPCproperty(data=X,nrep=500,
##D             property="ARL",chart=chartShewOneSided,
##D             params=list(threshold=4))
##D 
##D SPCproperty(data=X,nrep=500,
##D             property="hitprob",chart=chartShew,params=list(nsteps=100,threshold=4))
##D 
##D SPCproperty(data=X,nrep=500,
##D             property="hitprob",chart=chartShewOneSided,params=list(nsteps=100,threshold=4))
## End(Not run)

X<-rnorm(100)
chartShew <- new("SPCShew",model=SPCModelNormal())
## Not run: 
##D SPCproperty(data=X,nrep=500,
##D             property="calARL", chart=chartShew,
##D             params=list(target=1000))
##D SPCproperty(data=X,nrep=500,
##D             property="calhitprob",chart=chartShew,
##D             params=list(target=0.01,nsteps=100))
##D SPCproperty(data=X,nrep=10,chart=chartShew,
##D             property="ARL",params=list(threshold=3))
##D SPCproperty(data=X,nrep=500,
##D             property="hitprob",
##D             chart=chartShew,params=list(nsteps=100,threshold=4))
## End(Not run)




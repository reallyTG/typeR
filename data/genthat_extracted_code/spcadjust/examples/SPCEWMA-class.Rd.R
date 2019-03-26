library(spcadjust)


### Name: SPCEWMA-class
### Title: EWMA Charts
### Aliases: SPCEWMA-class

### ** Examples

X <-  rnorm(1000)
chart <- new("SPCEWMA",model=SPCModelNormal(Delta=0),lambda=0.8)
## Not run: 
##D SPCproperty(data=X,nrep=10,chart=chart,
##D             property="calARL",params=list(target=100))
##D SPCproperty(data=X,nrep=10,chart=chart,
##D             property="calhitprob",params=list(target=0.05,nsteps=1e3))
## End(Not run)
SPCproperty(data=X,nrep=10,chart=chart,
            property="ARL",params=list(threshold=3))
SPCproperty(data=X,nrep=10,chart=chart,
            property="hitprob",params=list(threshold=3,nsteps=1e3))
#increase the number of repetitions nrep for real applications.





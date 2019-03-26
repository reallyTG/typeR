library(dalmatian)


### Name: dalmatian
### Title: Run DGLM in 'JAGS' via 'rjags'
### Aliases: dalmatian

### ** Examples


## Not run: 
##D ## Load pied flycatcher data
##D data(pied_flycatchers_1)
##D 
##D ## Create variables bounding the true load
##D pfdata$lower=ifelse(pfdata$load==0,log(.001),log(pfdata$load-.049))
##D pfdata$upper=log(pfdata$load+.05)
##D ## Mean model
##D mymean=list(fixed=list(name="alpha",
##D                       formula=~ log(IVI) + broodsize + sex,
##D                       priors=list(c("dnorm",0,.001))))
##D 
##D ## Variance model
##D myvar=list(fixed=list(name="psi",
##D                       link="log",
##D                       formula=~broodsize + sex,
##D                       priors=list(c("dnorm",0,.001))))
##D 
##D ## Set working directory
##D ## By default uses a system temp directory. You probably want to change this.
##D workingDir <- tempdir()
##D 
##D ## Define list of arguments for jags.model()
##D jm.args <- list(file=file.path(workingDir,"pied_flycatcher_1_jags.R"),n.adapt=1000)
##D 
##D ## Define list of arguments for coda.samples()
##D cs.args <- list(n.iter=5000)
##D 
##D ## Run the model using dalmatian
##D pfresults <- dalmatian(df=pfdata,
##D                          mean.model=mymean,
##D                          variance.model=myvar,
##D                          jags.model.args=jm.args,
##D                          coda.samples.args=cs.args,
##D                          rounding=TRUE,
##D                          lower="lower",
##D                          upper="upper",
##D                          debug=FALSE)
## End(Not run)                          




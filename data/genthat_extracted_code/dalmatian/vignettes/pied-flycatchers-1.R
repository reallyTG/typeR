## ----echo=FALSE----------------------------------------------------------
runModels <- FALSE # If true rerun models. OTW, reload previous output.

## ------------------------------------------------------------------------
## Load package
library(dalmatian)

## ------------------------------------------------------------------------
## Load pied flycatcher data
data(pied_flycatchers_1)

## ------------------------------------------------------------------------
## Create variables bounding the true load
pfdata$lower=ifelse(pfdata$load==0,log(.001),log(pfdata$load-.049))
pfdata$upper=log(pfdata$load+.05)

## ------------------------------------------------------------------------
## Mean model
mymean=list(fixed=list(name="alpha",
       formula=~ log(IVI) + broodsize + sex,
       priors=list(c("dnorm",0,.001))))

## Variance model
myvar=list(fixed=list(name="psi",
      link="log",
      formula=~broodsize + sex,
      priors=list(c("dnorm",0,.001))))


## ------------------------------------------------------------------------

## Set working directory
## By default uses a system temp directory. You probably want to change this.
workingDir <- tempdir()

## Define list of arguments for jags.model()
jm.args <- list(file=file.path(workingDir,"pied_flycatcher_1_jags.R"),n.adapt=1000)

## Define list of arguments for coda.samples()
cs.args <- list(n.iter=5000,thin=20)

## Run the model using dalmatian
## This is how the model is run. However, to save you time we will load output from a previous run instead.
if(runModels){
  pfresults <- dalmatian(df=pfdata,
                         mean.model=mymean,
                         variance.model=myvar,
                         jags.model.args=jm.args,
                         coda.samples.args=cs.args,
                         rounding=TRUE,
                         lower="lower",
                         upper="upper",
                         debug=FALSE)
  
  save(pfresults,"pfresults.RData")
}
if(!runModels){
  load(system.file("Pied_Flycatchers_1","pfresults.RData",package="dalmatian"))
}

## ------------------------------------------------------------------------
## Compute convergence diagnostics
pfconvergence <- convergence(pfresults)

## Gelman-Rubin diagnostics
pfconvergence$gelman

## Raftery diagnostics
pfconvergence$raftery

## Effective sample size
pfconvergence$effectiveSize

## ----fig.width=6,fig.align="center"--------------------------------------
## Generate traceplots
pftraceplots <- traceplots(pfresults,plot=FALSE,nthin=100)

## Fixed effects for mean
pftraceplots$meanFixed

## Fixed effects for variance
pftraceplots$varianceFixed


## ------------------------------------------------------------------------
## Compute numerical summaries
summary(pfresults)

## ----fig.width=6,fig.align="center"--------------------------------------
## Generate caterpillar
pfcaterpillar <- caterpillar(pfresults,plot = FALSE)

## Fixed effects for mean
pfcaterpillar$meanFixed

## Fixed effects for variance
pfcaterpillar$varianceFixed

## ------------------------------------------------------------------------
# Random component of mean
mymean$random=list(name="epsilon",formula=~-1 + indidx)

# Random component of variance
myvar$random=list(name="xi",formula=~-1 + indidx)

## ------------------------------------------------------------------------

## Define initial values
inits <- lapply(1:3,function(i){
                setJAGSInits(mymean,
                      myvar,
                      y = runif(nrow(pfdata),pfdata$lower,pfdata$upper),
                      fixed.mean = tail(pfresults$coda[[i]],1)[1:4],
                      fixed.variance = tail(pfresults$coda[[i]],1)[5:7],
                      sd.mean = 1,
                      sd.variance=1)
  })

## Define list of arguments for jags.model()
jm.args <- list(file=file.path(workingDir,"pied_flycatcher_2_jags.R"),inits=inits,n.adapt=1000)

## Define list of arguments for coda.samples()
cs.args <- list(n.iter=5000,thin=10)

## Run the model using dalmatian
## This is how the model is run. However, to save you time we will load output from a previous run instead.

if(runModels){
  pfresults2 <- dalmatian(df=pfdata,
                          mean.model=mymean,
                          variance.model=myvar,
                          jags.model.args=jm.args,
                          coda.samples.args=cs.args,
                          rounding=TRUE,
                          lower="lower",
                          upper="upper",
                          debug=FALSE)
  
  save(pfresults2,"pfresults2.RData")
}
if(!runModels){
  load(system.file("Pied_Flycatchers_1","pfresults2.RData",package="dalmatian"))
}


## ------------------------------------------------------------------------
## Compute convergence diagnostics
pfconvergence2 <- convergence(pfresults2)

## Gelman-Rubin diagnostics
pfconvergence2$gelman

## Raftery diagnostics
pfconvergence2$raftery

## Effective sample size
pfconvergence2$effectiveSize

## ----fig.width=6,fig.align="center"--------------------------------------
## Generate traceplots
pftraceplots2 <- traceplots(pfresults2,plot = FALSE,nthin=100)

## Fixed effects for mean
pftraceplots2$meanFixed

## Fixed effects for variance
pftraceplots2$varianceFixed

## Random effects variances for mean
pftraceplots2$meanRandom

## Random effects variances for variances
pftraceplots2$varianceRandom


## ------------------------------------------------------------------------
## Compute numerical summaries
summary(pfresults2)

## ----fig.width=6,fig.align="center"--------------------------------------
## Generate caterpillar
pfcaterpillar2 <- caterpillar(pfresults2,plot = FALSE)

## Fixed effects for mean
pfcaterpillar2$meanFixed

## Fixed effects for variance
pfcaterpillar2$varianceFixed

## ------------------------------------------------------------------------
## Add 'log(IVI)' variable in pfdata
pfdata$'log(IVI)' <- log(pfdata$IVI)

## ------------------------------------------------------------------------
## Plot predictions for the Model 1
pred.pfresults <- fitted(object = pfresults, 
                             df = pfdata,
                             method = "mean",
                             ci = TRUE,
                             level = 0.95)

# predictions for the Model 2
pred.pfresults2 <- fitted(object = pfresults2,
                              df = pfdata,
                              method = "mean",
                              ci = TRUE,
                              level = 0.95)


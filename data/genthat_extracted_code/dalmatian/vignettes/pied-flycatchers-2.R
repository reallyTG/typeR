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
# Random component of mean
mymean=list(fixed=list(name="alpha",
                formula=~ log(IVI) + broodsize + sex,
                priors=list(c("dnorm",0,.001))),
    random=list(name="epsilon",formula=~-1 + indidx + indidx:log(IVI)))


# Random component of variance
myvar=list(fixed=list(name="psi",
               link="log",
               formula=~1,
               priors=list(c("dnorm",0,.001))))


## ------------------------------------------------------------------------
## Set working directory
## By default uses a system temp directory. You probably want to change this.
workingDir <- tempdir()

## Define list of arguments for jags.model()
jm.args <- list(file=file.path(workingDir,"pied_flycatcher_3_jags.R"),n.adapt=1000)

## Define list of arguments for coda.samples()
cs.args <- list(n.iter=1000)

## Run the model using dalmatian
if(runModels){
  pfresults3 <- dalmatian(df=pfdata,
                          mean.model=mymean,
                          variance.model=myvar,
                          jags.model.args=jm.args,
                          coda.samples.args=cs.args,
                          rounding=TRUE,
                          lower="lower",
                          upper="upper",
                          debug=FALSE)
  
  save(pfresults2,"pfresults3.RData")
}
if(!runModels){
  ## Load output from previously run chain
  load(system.file("Pied_Flycatchers_2","pfresults3.RData",package="dalmatian"))
}


## ------------------------------------------------------------------------
## Compute convergence diagnostics
pfconvergence2 <- convergence(pfresults3,raftery=list(r=.01))

## Gelman-Rubin diagnostics
pfconvergence2$gelman

## Raftery diagnostics
pfconvergence2$raftery

## Effective sample size
pfconvergence2$effectiveSize

## ----fig.width=6,fig.align="center"--------------------------------------
## Generate traceplots
pftraceplots2 <- traceplots(pfresults3,plot = FALSE)

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
summary(pfresults3)

## ----fig.width=6,fig.align="center"--------------------------------------
## Generate caterpillar
pfcaterpillar2 <- caterpillar(pfresults3,plot = FALSE)

## Fixed effects for mean
pfcaterpillar2$meanFixed

## Fixed effects for variance
pfcaterpillar2$varianceFixed

## ----fig.width=6,fig.align="center"--------------------------------------
## Compute summary statistics for random effects
ranef2 <- ranef(pfresults3)

## Load ggplot2
library(ggplot2)

## Identify number of individuals
nind <- nlevels(pfdata$indidx)

## Plot predicted random slopes
ggplot(data=as.data.frame(ranef2$mean[nind+(1:nind),]),aes(x=1:nind,y=Mean)) + 
  geom_point() + 
  geom_errorbar(aes(ymin=`Lower 95%`,ymax=`Upper 95%`)) +
  geom_abline(intercept=0,slope=0)


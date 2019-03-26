library(dalmatian)


### Name: setJAGSInits
### Title: Set initial values for 'dalmatian'
### Aliases: setJAGSInits

### ** Examples

## Load pied flycatcher data
data(pied_flycatchers_1)

## Create variables bounding the true load
pfdata$lower=ifelse(pfdata$load==0,log(.001),log(pfdata$load-.049))
pfdata$upper=log(pfdata$load+.05)

## Load output from previously run model
load(system.file("Pied_Flycatchers_1","pfresults.RData",package="dalmatian"))

## Set initial values for a new run of the same model
inits <- lapply(1:3,function(i){
  setJAGSInits(pfresults$mean.model,
               pfresults$variance.model,
               y = runif(nrow(pfdata),pfdata$lower,pfdata$upper),
               fixed.mean = tail(pfresults$coda[[i]],1)[1:4],
               fixed.variance = tail(pfresults$coda[[i]],1)[5:7],
               sd.mean = 1)
})




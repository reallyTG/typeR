library(dalmatian)


### Name: fitted.dalmatian
### Title: Prediction method for dalmatian Fitted Objects
### Aliases: fitted.dalmatian

### ** Examples


## Load pied flycatcher data
data(pied_flycatchers_1)

## Create variables bounding the true load
pfdata$lower=ifelse(pfdata$load==0,log(.001),log(pfdata$load-.049))
pfdata$upper=log(pfdata$load+.05)

## Add 'log(IVI)' variable in pfdata
pfdata$'log(IVI)' <- log(pfdata$IVI)

## Load output from previously run model
load(system.file("Pied_Flycatchers_1","pfresults.RData",package="dalmatian"))

## Compute fitted values 
pred.pfresults <- fitted(object = pfresults, 
                         df = pfdata,
                         method = "mean",
                         ci = TRUE,
                         level = 0.95)




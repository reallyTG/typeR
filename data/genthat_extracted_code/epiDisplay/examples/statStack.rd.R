library(epiDisplay)


### Name: statStack
### Title: Statistics of a continuous variable stratified by factors
### Aliases: statStack
### Keywords: aplot

### ** Examples


statStack(Price, by=c(DriveTrain, Origin), dataFrame=Cars93)
statStack(Price, by=c(DriveTrain, Origin), dataFrame=Cars93, iqr=NULL)

Cars93$log10.Price <- log10(Cars93$Price)# added as the 28th variable
statStack(log10.Price, by=c(DriveTrain, Origin), dataFrame=Cars93)
statStack(log10.Price, by=c(DriveTrain, Origin), dataFrame=Cars93, iqr=28)
rm(Cars93)

data(Compaq)
statStack(year, by=c(hospital, stage:ses), dataFrame=Compaq)
# Note that var.labels 'Age group' is displayed instead of var. name 'agegr'




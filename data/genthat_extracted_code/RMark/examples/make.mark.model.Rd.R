library(RMark)


### Name: make.mark.model
### Title: Create a MARK model for analysis
### Aliases: make.mark.model
### Keywords: model

### ** Examples


## No test: 
# This example is excluded from testing to reduce package check time
data(dipper)
#
# Process data
#
dipper.processed=process.data(dipper,groups=("sex"))
#
# Create default design data
#
dipper.ddl=make.design.data(dipper.processed)
#
# Add Flood covariates for Phi and p that have different values
#
dipper.ddl$Phi$Flood=0
dipper.ddl$Phi$Flood[dipper.ddl$Phi$time==2 | dipper.ddl$Phi$time==3]=1
dipper.ddl$p$Flood=0
dipper.ddl$p$Flood[dipper.ddl$p$time==3]=1
#
#  Define range of models for Phi
#
Phidot=list(formula=~1)
Phitime=list(formula=~time)
PhiFlood=list(formula=~Flood)
#
#  Define range of models for p
#
pdot=list(formula=~1)
ptime=list(formula=~time)
#
# Make assortment of models
#
dipper.phidot.pdot=make.mark.model(dipper.processed,dipper.ddl,
  parameters=list(Phi=Phidot,p=pdot))
dipper.phidot.ptime=make.mark.model(dipper.processed,dipper.ddl,
  parameters=list(Phi=Phidot,p=ptime))
dipper.phiFlood.pdot=make.mark.model(dipper.processed,dipper.ddl,
  parameters=list(Phi=PhiFlood, p=pdot))
## End(No test)




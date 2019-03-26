library(RMark)


### Name: popan.derived
### Title: Computes some derived abundance estimates for POPAN models
### Aliases: popan.derived popan.Nt popan.NGross
### Keywords: utility

### ** Examples

## No test: 
# This example is excluded from testing to reduce package check time
# Example
data(dipper)
dipper.processed=process.data(dipper,model="POPAN",groups="sex")
run.dipper.popan=function()
{
dipper.ddl=make.design.data(dipper.processed)
Phidot=list(formula=~1)
Phitime=list(formula=~time)
pdot=list(formula=~1)
ptime=list(formula=~time)
pentsex.time=list(formula=~time)
Nsex=list(formula=~sex)
#
# Run assortment of models
#
dipper.phisex.time.psex.time.pentsex.time=mark(dipper.processed,
     dipper.ddl,model.parameters=list(Phi=Phidot,p=ptime,
     pent=pentsex.time,N=Nsex),invisible=FALSE,adjust=FALSE)
dipper.psex.time.pentsex.time=mark(dipper.processed,dipper.ddl,
     model.parameters=list(Phi=Phitime,p=pdot,
     pent=pentsex.time,N=Nsex),invisible=FALSE,adjust=FALSE)
#
# Return model table and list of models
#
return(collect.models() )
}
dipper.popan.results=run.dipper.popan()
popan.derived(dipper.processed,dipper.popan.results)
## End(No test)




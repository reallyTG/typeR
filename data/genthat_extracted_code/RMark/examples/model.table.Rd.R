library(RMark)


### Name: model.table
### Title: Create table of MARK model selection results
### Aliases: model.table

### ** Examples

## No test: 
# This example is excluded from testing to reduce package check time
data(dipper)
run.dipper=function()
{
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
Phi.dot=list(formula=~1)
Phi.time=list(formula=~time)
Phi.sex=list(formula=~sex)
Phi.sextime=list(formula=~sex+time)
Phi.sex.time=list(formula=~sex*time)
Phi.Flood=list(formula=~Flood)
#
#  Define range of models for p
#
p.dot=list(formula=~1)
p.time=list(formula=~time)
p.sex=list(formula=~sex)
p.sextime=list(formula=~sex+time)
p.sex.time=list(formula=~sex*time)
p.Flood=list(formula=~Flood)
#
# Return model table and list of models
#
cml=create.model.list("CJS")
return(mark.wrapper(cml,data=dipper.processed,ddl=dipper.ddl))
}

dipper.results=run.dipper()
dipper.results
dipper.results$model.table=model.table(dipper.results,model.name=FALSE)
dipper.results
#
# Compute matrices of model weights, number of parameters and Delta AICc values
#
model.weight.matrix=tapply(dipper.results$model.table$weight,
 list(dipper.results$model.table$Phi,dipper.results$model.table$p),mean)
model.npar.matrix=tapply(dipper.results$model.table$npar,
 list(dipper.results$model.table$Phi,dipper.results$model.table$p),mean)
model.DeltaAICc.matrix=tapply(dipper.results$model.table$DeltaAICc,
 list(dipper.results$model.table$p,dipper.results$model.table$Phi),mean)
#
# Output DeltaAICc as a tab-delimited text file that can be read into Excel 
# (to do that directly use RODBC or xlsreadwrite package for R)
#
write.table(model.DeltaAICc.matrix,"DipperDeltaAICc.txt",sep="\t")
## End(No test)




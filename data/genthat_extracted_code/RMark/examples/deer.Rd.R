library(RMark)


### Name: deer
### Title: White-tailed deer double observer spotlight capture-recapture
###   analysis
### Aliases: deer
### Keywords: datasets

### ** Examples


## No test: 
# This example is excluded from testing to reduce package check time
data(deer)
x=data.frame(ch=paste(deer$TI, deer$SL, sep=""), Survey=factor(deer$Group), 
     Year=factor(deer$Year), Cluster=deer$Cluster, MgtUnit=factor(deer$MgmtUnit))
x$ch=as.character(x$ch)
bfrun=function(){
x.proc=process.data(x, model="Huggins", groups=c("Survey", "Year", "MgtUnit"))
x.ddl=make.design.data(x.proc)

#Silly Null model, constant p & c sharing 1 parameter (one detection estimate)
p.shared=list(formula=~1,share=TRUE)
mod.1=mark(x.proc, x.ddl, model.parameters=list(p=p.shared), invisible=FALSE)
 
#2 Parameter Null Model, constant p, constant c, different p and c (one estimate for each; p ne c)
#p(time), c(-), share=TRUE, detection is time dependent, with recapture parameter shared
p.sharetime=list(formula=~time, share=TRUE)
mod.2=mark(x.proc, x.ddl, model.parameters=list(p=p.sharetime), invisible=FALSE)

#2a Parameter Null Model, constant p, constant c,
# different p and c (one estimate for each; p ne c) not using share
mod.2a=mark(x.proc, x.ddl, model.parameters=list(p=list(formula=~1), c=list(formula=~1)))

#Fully parameterized model, different p and c for each survey transect replicate, 
# management unit, method (TI or SL) and any observers
p.survey=list(formula=~Survey*time, share=TRUE)
mod.3=mark(x.proc, x.ddl, model.parameters=list(p=p.survey), invisible=FALSE)

#p(MU), c(MU), initial detection and recapture differ and are management unit dependent
p.mu=list(formula=~MgtUnit*time, share=TRUE)
mod.4=mark(x.proc, x.ddl, model.parameters=list(p=p.mu), invisible=FALSE)

#p(MU) detection is management unit dependent
p.mu=list(formula=~MgtUnit, share=TRUE)
mod.5=mark(x.proc, x.ddl, model.parameters=list(p=p.mu), invisible=FALSE)

#p(Yr + MgtUnit),  detection is year + MgtUnit
p.yearMgtUnit=list(formula=~Year*time+MgtUnit, share=TRUE)
mod.6=mark(x.proc, x.ddl, model.parameters=list(p=p.yearMgtUnit), invisible=FALSE)

#p(Year), initial detection and recapture are year dependent
p.year=list(formula=~Year*time, share=TRUE)
mod.7=mark(x.proc, x.ddl, model.parameters=list(p=p.year), invisible=FALSE)

return(collect.models())
}
bf.out=bfrun()
bf.out

#export function to send dataset and covariates data to MARK for bootstrap analysis 
#(not run but here for completeness)
#export.MARK(x.proc, "BFdeer", mod.3, replace=TRUE, ind.covariates="all")
## End(No test)




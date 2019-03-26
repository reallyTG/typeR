library(RMark)


### Name: RDSalamander
### Title: Robust design salamander occupancy data
### Aliases: RDSalamander
### Keywords: datasets

### ** Examples

## No test: 
# This example is excluded from testing to reduce package check time
fit.RDOccupancy=function()
{
   data(RDSalamander)
   occ.p.time.eg=mark(RDSalamander,model="RDOccupEG",
      time.intervals=c(rep(0,47),1,rep(0,30)),
      model.parameters=list(p=list(formula=~session)),threads=2)
   occ.p.time.pg=mark(RDSalamander,model="RDOccupPG",
      time.intervals=c(rep(0,47),1,rep(0,30)),
      model.parameters=list(Psi=list(formula=~time),
      p=list(formula=~session)),threads=2)
   occ.p.time.pe=mark(RDSalamander,model="RDOccupPE",
      time.intervals=c(rep(0,47),1,rep(0,30)),
      model.parameters=list(Psi=list(formula=~time),
      p=list(formula=~session)),threads=2)
return(collect.models())
}
RDOcc=fit.RDOccupancy()
print(RDOcc)
## End(No test)





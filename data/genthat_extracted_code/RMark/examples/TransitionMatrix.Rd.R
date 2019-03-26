library(RMark)


### Name: TransitionMatrix
### Title: Multi-state Transition Functions
### Aliases: TransitionMatrix find.possible.transitions transition.pairs
### Keywords: utility

### ** Examples

## No test: 
# This example is excluded from testing to reduce package check time
data(mstrata)
# Show possible transitions in first 15 ch values
find.possible.transitions(mstrata$ch[1:15])
# Show transtion pairs for same data
transition.pairs(mstrata$ch[1:15])
#limit transtions to 2 and 3 character values for first 30 ch
transition.pairs(substr(mstrata$ch[1:30],2,3))

# fit the sequence of multistrata models as shown for ?mstrata
run.mstrata=function()
{
#
# Process data
#
mstrata.processed=process.data(mstrata,model="Multistrata")
#
# Create default design data
#
mstrata.ddl=make.design.data(mstrata.processed)
#
#  Define range of models for S; note that the betas will differ from the output
#  in MARK for the ~stratum = S(s) because the design matrix is defined using
#  treatment contrasts for factors so the intercept is stratum A and the other
#  two estimates represent the amount that survival for B abd C differ from A.
#  You can use force the approach used in MARK with the formula ~-1+stratum which
#  creates 3 separate Betas - one for A,B and C.
#
S.stratum=list(formula=~stratum)
S.stratumxtime=list(formula=~stratum*time)
#
#  Define range of models for p
#
p.stratum=list(formula=~stratum)
#
#  Define range of models for Psi; what is denoted as s for Psi
#  in the Mark example for Psi is accomplished by -1+stratum:tostratum which
#  nests tostratum within stratum.  Likewise, to get s*t as noted in MARK you
#  want ~-1+stratum:tostratum:time with time nested in tostratum nested in
#  stratum.
#
Psi.s=list(formula=~-1+stratum:tostratum)
#
# Create model list and run assortment of models
#
model.list=create.model.list("Multistrata")
#
# Add on a specific model that is paired with fixed p's to remove confounding
#
p.stratumxtime=list(formula=~stratum*time)
p.stratumxtime.fixed=list(formula=~stratum*time,fixed=list(time=4,value=1))
model.list=rbind(model.list,c(S="S.stratumxtime",p="p.stratumxtime.fixed",
               Psi="Psi.s"))
#
# Run the list of models
#
mstrata.results=mark.wrapper(model.list,data=mstrata.processed,ddl=mstrata.ddl)
#
# Return model table and list of models
#
return(mstrata.results)
}
mstrata.results=run.mstrata()
mstrata.results
# for the best model, get.real to get a list containing all Psi estimates
#  and the v-c matrix
Psilist=get.real(mstrata.results[[1]],"Psi",vcv=TRUE)
Psivalues=Psilist$estimates
# call Transition matrix using values from time==1; the call to the function
# must only contain one record for each possible transition. An error message is
# given if not the case
TransitionMatrix(Psivalues[Psivalues$time==1,])
# call it again but specify the vc matrix to get se and conf interval
TransitionMatrix(Psivalues[Psivalues$time==1,],vcv.real=Psilist$vcv.real)
## End(No test)



